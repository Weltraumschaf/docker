#!/usr/bin/env bash

set -ue

cwd=$(pwd)

karaf_version="4.2.1"
karaf_base_url="$(curl -s https://www.apache.org/dyn/closer.cgi\?preferred\=true)karaf/${karaf_version}/"
karaf_dist="apache-karaf-${karaf_version}"
karaf_dist_file_name="${karaf_dist}.tar.gz"
karaf_download_url="${karaf_base_url}${karaf_dist_file_name}"
karaf_distribution="${cwd}/${karaf_dist_file_name}"

echo "Download ${karaf_download_url} ..."
curl -s "${karaf_download_url}" --output "${karaf_distribution}"
tar xzvf "${karaf_dist_file_name}" && rm -rfv "${karaf_dist_file_name}"
