#!/bin/sh
# http://mpd.wikia.com/index.php?title=Hack:di.fm-playlists

mpd_conf="/etc/mpd.conf"
default_url="http://listen.di.fm/public3"

usage()
{
cat <<EOF
Usage: di.sh [PLAYLIST_DIR] [URL] [FILENAME_PREFIX]
PLAYLIST_DIR will be taken from ${mpd_conf} by default
URL defaults to http://listen.di.fm/public3
public1: AAC 64, public2: AAC 32, public3: MP3 96, public5: WMA 40

EXAMPLE
di.sh /var/lib/mpd/playlists
di.sh /var/lib/mpd/playlists listen.sky.fm/public3
EOF
  exit ${1:-1}
}

# Be nice to user with standard help options
if [ "$1" = "-h" ] || [ "$1" = "--help" ] ; then
  usage 0
fi

# Process user arguments and default values
dir=$1
: ${url:=${2:-${default_url}}}
: ${prefix:=${3:-`echo "$url" | sed 's/.*\b\([^.]\+\.[^.]\+\)\/.*/\1/'`}}

# Handle default playlist dir
if [ -z "$dir" ] ; then
  if [ -e "${mpd_conf}"  ] ; then
    eval dir=`awk '$1=="playlist_directory"{print $NF}' "${mpd_conf}"`
  fi
  if [ -z "$dir" ] || [ ! -d "$dir" ] ; then
    echo "sorry, unable to find mpd playlist dir: $dir"
    exit 1
  fi
fi

# Extract a value from json data given the keyword index
json_val()
{
  local key=$1; shift
  echo "$@" | sed -E -e 's|.*"'"${key}"'":"([^"]*)".*|\1|' -e 's:\\::g'
}

# Grab the json data and format it into newlines
wget -q -O - "$url" | sed -e 's:},{:\n:g' -e 's:^\[{::' -e 's:}\]$::' | \
while read line ; do
  # Extract the human friendly name of the stream
  name=$(json_val name "${line}")
  # Extract the full URL to the .pls file
  pls=$(json_val playlist "${line}")
  # Grab the pls file and convert it to a m3u
  file="${dir}/${prefix} ${name}.m3u"
  wget -q -O - "${pls}" | sed -n 's/^File[0-9]*=//p' > "${file}"
done
