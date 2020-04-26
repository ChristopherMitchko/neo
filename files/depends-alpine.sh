
# get lfs linux from scratch depends

apk fix
apk update
apk add bash nano nano-syntax file binutils bison bzip2 coreutils diffutils findutils gawk grep gzip m4 make patch perl sed tar texinfo xz 

# important pkg's
apk add gcc linux-headers libc-dev

rm -f /bin/sh
ln -sv /bin/bash /bin/sh
echo 'include "/usr/share/nano/*nanorc"' > /etc/nanorc

# adding color, just use echo -e
Red='\033[0;31m'
Green='\033[0;32m'
Blue='\033[0;34m'
Cyan='\033[0;36m'
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
echo -n -e "${Cyan}Grep: ${Neg}"; grep --version | head -n1
echo -n -e "${Cyan}Gzip: ${Neg}"; gzip --version | head -n1
echo -n -e "${Cyan}M4: ${Neg}"; m4 --version | head -n1
echo -n -e "${Cyan}Make: ${Neg}"; make --version | head -n1
echo -n -e "${Cyan}Patch: ${Neg}"; patch --version | head -n1
echo -e "${Cyan}Perl: ${Neg} `perl -V:version` "
echo -n -e "${Cyan}Sed: ${Neg}"; sed --version | head -n1
echo -n -e "${Cyan}Tar: ${Neg}"; tar --version | head -n1
echo -n -e "${Cyan}Makeinfo: ${Neg}"; makeinfo --version | head -n1  # texinfo version
echo -n -e "${Cyan}XZ-utils: ${Neg}"; xz --version | head -n1
#echo -n -e "${Cyan}Python: ${Neg}"; python --version
echo -n -e "${Cyan}GCC: ${Neg}"; gcc --version | head -n1
#echo -n -e "${Cyan}G++: ${Neg}"; g++ --version | head -n1

cat <<'EOF' >> dummy.c
#include <stdio.h>

int main(void) {
    printf("Hello, world!\n");
    return 0;
}
EOF
c99 -o dummy dummy.c
if [ -x dummy ]
  then echo -e "${Green}cc compilation OK ${Neg}";
  else echo -e "${Red}cc compilation failed ${Neg}"; fi
rm -vf dummy.c dummy
