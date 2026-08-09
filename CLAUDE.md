# CLAUDE.md

This file provides guidance to Claude Code (claude.ai/code) when working with code in this repository.

## Repo purpose

Collection of standalone Docker image definitions, published under the `weltraumschaf/*` Docker Hub namespace. Each `img-*` directory (plus `experimental-debian-zabbix`) is an independent image: its own `Dockerfile` and `Taskfile.yml`, no shared build context.

## Commands

Build tooling is [Task](https://taskfile.dev) (`Taskfile.yml`), not Make.

Root `Taskfile.yml` fans out to every `img-*` directory (found via `find . -maxdepth 1 -type d -name 'img-*'` — note `experimental-debian-zabbix` is excluded from the root fan-out since it doesn't match the `img-*` glob):

```bash
task build   # docker build in every img-* dir
task push    # docker push every image
task lint    # hadolint every Dockerfile
```

Per-image, run the same tasks scoped to one directory with `-d`:

```bash
task -d img-claude-code build
task -d img-claude-code lint
task -d img-claude-code push
```

Or `cd` into the image dir and run `task build` / `task lint` / `task push` / plain `task` (runs lint → build → push in sequence).

Linting is [hadolint](https://github.com/hadolint/hadolint) against the Dockerfile — install it locally (`brew install hadolint`) to run `task lint` outside CI. Each image dir has a `.hadolint.yaml` (auto-discovered by hadolint from its cwd, no `-c` flag needed) that ignores DL3008 (pin apt package versions) — base images here float (`debian:trixie`, etc, no digest pins), so hard-pinning apt versions would fight that and break on every base rebuild. Every other hadolint finding should be fixed for real, not ignored.

There are no test suites in this repo — verification is: hadolint passes, and the image builds.

## Adding a new image

Each image dir needs a `Dockerfile` and a `Taskfile.yml`. Copy an existing `Taskfile.yml` (e.g. `img-golang-build/Taskfile.yml`) and change the `env` block (`IMAGE_NAME`, `IMAGE_VERSION`) — the `build`/`push`/`lint`/`default` task bodies are identical across every image and should stay that way.

## Dockerfile conventions

- Base every image on `debian:trixie` (or an image built from it) unless there's a specific reason not to (e.g. `img-golang-build` uses `golang:trixie`, `img-java-base` uses `eclipse-temurin:25-jdk`).
- Every image carries the full [label-schema.org](http://label-schema.org/rc1/) label set (`org.label-schema.*`), populated from the `BUILD_DATE` (`date -u +'%Y-%m-%dT%H:%M:%SZ'`), `VCS_REF` (`git rev-parse --short HEAD`), and `BUILD_VERSION` (`IMAGE_VERSION` from the Taskfile) build args — set these via `--build-arg`, don't hardcode them.
- `LABEL org.label-schema.docker.cmd` documents the canonical `docker run` invocation for that image; keep it accurate when the run pattern changes.
- Must pass `hadolint` cleanly (see `task lint`).

## Image dependency graph

Some images build `FROM` other images in this repo, so those must be built (and available locally, or pulled) before their dependents:

- `img-debian-in-a-nutshell` — base Debian image with dotfiles/shell-scripts installed. Depended on by:
  - `img-debian-nodejs` (`FROM weltraumschaf/debian-in-a-nutshell:3.0.0`)
  - `experimental-debian-zabbix` (`FROM weltraumschaf/debian-in-a-nutshell:1.0.0`)
- `img-claude-code`, `img-golang-build`, `img-java-base` build from upstream base images directly (`debian:trixie`, `golang:trixie`, `eclipse-temurin:25-jdk`), not from each other.

When bumping `img-debian-in-a-nutshell`'s `IMAGE_VERSION`, update the `FROM` tag in its dependents' Dockerfiles to match.

## Versioning

Each image has its own independent `IMAGE_VERSION` in its `Taskfile.yml` `env` block — versions are not synced across images. Bump it manually when an image's Dockerfile changes.
