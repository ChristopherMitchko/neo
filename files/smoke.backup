#!/usr/bin/env bash
#set -x

export cwd=$(pwd)
export buildscript=${cwd}/bookbuild
export station=~/station
export staging=${station}/staging
export installdir="/data/data/com.termux/files/usr/tmp"
[ -f ./bookbuild ] && . ./bookbuild || { echo -e "\e[31mERROR: bookbuild not found in\n\e[00m${cwd}\n" 1>&2 ; exit 1; }

export author=$author
export package=$package
export version=$version
export essential=$essential
export priority=$priority
export section=$section
export installedsize=$installedsize
export predepends=$predepends
export depends=$depends
export recommends=$recommends
export suggests=$suggests
export enhances=$enhances
export replaces=$replaces
export conflicts=$conflicts
export breaks=$breaks
export provides=$provides
export architecture=$architecture
export maintainer=$maintainer
export website=$website
export homepage=$homepage
export depiction=$depiction
export description=$description

# create output message functions
print() {
  local s="$*"
  echo -e "\e[36m=======\e[1;34m>\e[0m $s\e[0m"
}

error() {
  local s="$*"
  echo -e "\e[31m=======\e[1;33m>\e[00m$s\033[1;00m"
}

logo() {
local s="$*"
echo -e " \033[36m_______"
echo -e " \033[1;34m|\033[36m#####\033[1;34m|"
echo -e " \033[1;34m|\033[36m#\033[1;31m $ \033[36m#\033[1;34m|\033[1;34m--[\e[31m$s\033[1;34m]--\033[1;00m"
echo -e " \033[1;34m|\033[36m#####\033[1;34m|\033[1;00m"
}
logo "peril package manager/builder"

check_root() {
perl <<'EOF'
use strict;
use warnings;
use Term::ANSIColor;
if ( $< == 0 ) {
print colored("root=yes\n", 'bright_blue on_black');
}
else {
print colored("root=no\n", 'bright_yellow on_black');
}
EOF
}
check_root

check_fakeroot() {
perl <<'EOF'
use strict;
use warnings;
use Term::ANSIColor;
use IPC::Cmd qw[can_run run];
if ( my $full_path = can_run('fakeroot') or die) {
print colored("fakeroot=yes \n", 'bright_blue on_black');
}
else {
print colored("fakeroot=no \n", 'bright_yellow on_black');
}
EOF
}
check_fakeroot

net_check() {
print "network connection check!"
ping -q -c 1 -W 1 www.google.com >> /dev/null 2>&1
if [[ $? -eq 0 ]]; then
  echo "ping success!"
else
  echo "ping failure!"
fi
wget -q --tries=10 --timeout=20 --spider http://google.com
if [[ $? -eq 0 ]]; then
  echo "wget success!"
else
  echo "wget failure!"
fi
}
net_check

print "Package is: ${package}-${version}"

fetch () {
perl -w <<'EOF'
use strict;
use warnings 'all';
use File::Fetch;
$File::Fetch::WARN = 0;
use Term::ANSIColor;
my $url = $ENV{website};
my $ff = File::Fetch->new(uri => $url);
my $file = $ff->file ;
print colored("=> Attempting to fetch sources!\n", 'bright_cyan on_black');
eval{my $where = $ff->fetch( to => $ENV{station}) or die};
if ( $@ ){
print colored("Could not fetch: ${url}\n", 'bright_white on_black');
print colored("Broken URL or no Network Connection. \n", 'bright_red on_black');
}
print colored("Fetched:", 'bright_blue on_black');
print colored("$ENV{station}/${file} \n", 'bright_white on_black');
EOF
}
fetch

peril() {
perl <<'EOF'
print "\n";
EOF
}
peril
# end of file
