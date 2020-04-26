

apt update

# basic pkg's
apt install nano vim

# basic lfs linux from scratch dependencies
apt install binutils bison bzip2 coreutils diffutils findutils gawk gcc g++ grep gzip m4 make automake autoconf libtool patch perl python sed tar texinfo xz-utils check

# basic build essential pkg's
apt install build-essential fakeroot dpkg-dev debhelper devscripts dh-make dh-autoreconf dh-buildinfo dput libncurses5-dev libncursesw5-dev

# basic apt pkg utils and repo clone pkg's
apt install apt-build apt-clone apt-cacher apt-doc apt-dpkg-ref apt-move apt-mirror apt-offline apt-rdepends apt-src apt-show-source apt-show-versions apt-file apt-listchanges apt-listdifferences apt-utils apt-venv aptdaemon aptdaemon-data aptfs aptitude aptitude-common aptitude-doc-en aptitude-robot aptly aptly-publisher aptsh local-apt-repository

# linux-headers
# normal linux distro
#apt install linux-headers-$(uname -r)
# android chroot
apt install linux-headers-$(uname -r)


# sh must point to bash
rm -f /bin/sh
ln -s /bin/bash /bin/sh

# Simple script to list version numbers of critical development tools

# adding color, just use echo -e
Black='\033[0;30m'
Red='\033[0;31m'
Green='\033[0;32m'
BrownOrange='\033[0;33m'
Blue='\033[0;34m'
Purple='\033[0;35m'
Cyan='\033[0;36m'
LightGray='\033[0;37m'
DarkGray='\033[1;30m'
LightRed='\033[1;31m'
LightGreen='\033[1;32m'
Yellow='\033[1;33m'
LightBlue='\033[1;34m'
LightPurple='\033[1;35m'
LightCyan='\033[1;36m'
Neg='\033[00m'

export LC_ALL=C
echo -n -e "${Cyan}Bash: ${Neg}"; bash --version | head -n1 | cut -d" " -f2-4
MYSH=$(readlink -f /bin/sh)
echo -e "${Cyan}/bin/sh -> $MYSH ${Neg}"
echo $MYSH | grep -q bash || echo -e "${Red}ERROR: /bin/sh does not point to bash${Neg}"
unset MYSH

echo -n -e "${Cyan}File: ${Neg}"; file --version | head -n1 | cut -d" " -f3-

echo -n -e "${Cyan}Binutils: ${Neg}"; ld --version | head -n1 | cut -d" " -f3-

echo -n -e "${Cyan}Bison: ${Neg}"; bison --version | head -n1

if [ -h /usr/bin/yacc ]; then
  echo -e "${Cyan}/usr/bin/yacc -> `readlink -f /usr/bin/yacc`${Neg}";
elif [ -x /usr/bin/yacc ]; then
  echo -e "${Blue}yacc is `/usr/bin/yacc --version | head -n1`${Neg}"
else
  echo -e "${Red}yacc not found${Neg}"
fi

echo -n -e "${Cyan}Bzip2: ${Neg}"; bzip2 --version 2>&1 < /dev/null | head -n1 | cut -d" " -f1,6-
echo -n -e "${Cyan}Coreutils: ${Neg}"; chown --version | head -n1 | cut -d")" -f2
echo -n -e "${Cyan}Diffutils: ${Neg}"; diff --version | head -n1
echo -n -e "${Cyan}Findutils: ${Neg}"; find --version | head -n1
echo -n -e "${Cyan}Gawk: ${Neg}"; gawk --version | head -n1

if [ -h /usr/bin/awk ]; then
  echo -e "${Cyan}/usr/bin/awk -> `readlink -f /usr/bin/awk`${Neg}";
elif [ -x /usr/bin/awk ]; then
  echo -e "${Blue}awk is `/usr/bin/awk --version | head -n1` ${Neg}"
else
  echo -e "${Red}awk not found ${Neg}" 
fi

echo -n -e "${Cyan}GCC: ${Neg}"; gcc --version | head -n1
echo -n -e "${Cyan}G++: ${Neg}"; g++ --version | head -n1
echo -n -e "${Cyan}Libc: ${Neg}"; ldd --version | head -n1 | cut -d" " -f2-  # libc version
echo -n -e "${Cyan}Grep: ${Neg}"; grep --version | head -n1
echo -n -e "${Cyan}Gzip: ${Neg}"; gzip --version | head -n1
echo -n -e "${Cyan}Linux/linux-headers: ${Neg}"; cat /proc/version
echo -n -e "${Cyan}M4: ${Neg}"; m4 --version | head -n1
echo -n -e "${Cyan}Make: ${Neg}"; make --version | head -n1
echo -n -e "${Cyan}Patch: ${Neg}"; patch --version | head -n1
echo -e "${Cyan}Perl: ${Neg} `perl -V:version` "
echo -n -e "${Cyan}Python: ${Neg}"; python --version
echo -n -e "${Cyan}Sed: ${Neg}"; sed --version | head -n1
echo -n -e "${Cyan}Tar: ${Neg}"; tar --version | head -n1
echo -n -e "${Cyan}Makeinfo: ${Neg}"; makeinfo --version | head -n1  # texinfo version
echo -n -e "${Cyan}XZ-utils: ${Neg}"; xz --version | head -n1

echo 'int main(){}' > dummy.c && g++ -o dummy dummy.c
if [ -x dummy ]
  then echo -e "${Green}g++ compilation OK ${Neg}";
  else echo -e "${Red}g++ compilation failed ${Neg}"; fi
rm -f dummy.c dummy
