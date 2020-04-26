#!/usr/bin/env bash
##########################################################################################
#
# Bash script to download/clone debian source packages from debian repo's and mirrors
#
# LICIENCE= GPL-V3             by: Christopher Mitchko
##########################################################################################

export web=/alfa/website
export data=$web/database
export contrib=$data/contrib
export nonfree=$data/non-free

mkdir -pv $contrib; mkdir -pv $nonfree;

# Debian mirror or repo URL's---\|/----------------------------------------------------------#
# suggestion: seach and find the fastest mirrors closest to you
# point to main with no leading "/", later we will get contrib and non-free
# and keep deian repo main directory structure because this many files get sloppy quick
export URL1=http://archive.debian.org/debian-archive/debian/pool/main
export URL2=http://ftp.us.debian.org/debian/pool/main
export URL3=http://http.kali.org/kali/pool/main
# can add more if you like and copy the wget command, point to URL+
#--------------------------------------------------------------------------------------------#


# MAIN--------------------------\|/----------------------------------------------------------#
#--------------------------------------------------------------------------------------------#

# colorful output------------#
Black='\033[0;30m';
Red='\033[0;31m';
Green='\033[0;32m';
Orange='\033[0;33m';
Blue='\033[0;34m';
Purple='\033[0;35m';
Cyan='\033[0;36m';
LightGray='\033[0;37m';
DarkGray='\033[1;30m';
LightRed='\033[1;31m';
LightGreen='\033[1;32m';
Yellow='\033[1;33m';
LightBlue='\033[1;34m';
LightPurple='\033[1;35m';
LightCyan='\033[1;36m';
White='\033[1;37m';
#----------------------------#
if [ $# -eq 0 ]
then
echo -e ${LightRed}"#-------------------------------------\/-Message-\/---------------------------------------------------------------------#"
echo -e "${White}First thanks to ${LightRed}Debian ${LightCyan}Linux ${White}that has been going strong since ${LightBlue}1${LightRed}9${LightGreen}9${LightPurple}4${White}, and keeping old source packages in its repositories."
echo -e "This ${LightGreen}orig-wget.sh ${White}clones ${LightRed}debian ${White}source packages from a debian ${LightPurple}r${LightBlue}e${LightCyan}p${Yellow}o${White}, all credit and thanks to ${LightRed}debian${White}."
echo -e "It will only download the source packages from ${LightBlue}r${LightPurple}e${Yellow}p${LightGreen}o${White}, files ending in .${Yellow}o${LightCyan}r${LightRed}i${LightBLue}g${White}.${LightGreen}t${LightPurple}a${LightRed}r${White}.${LightBLue}g${LightRed}z${White}, .${LightPurple}o${LightBlue}r${LightCyan}i${Yellow}g${White}.${LightRed}t${LightCyan}a${LightGreen}r${White}.${Yellow}x${LightPurple}z${White}, .${LightGreen}o${LightBlue}r${LightCyan}i${Yellow}g${White}.${LightRed}t${LightCyan}a${LightCyan}r}${White}.${LightRed}b${LightBlue}z${LightPurple}2${White}"
echo -e "It can and will continue if already started and connection was lost."
echo -e "It will search the index files again then pick up where it left off."
echo -e "And be sure to get yourself a ${LightGreen}c${LightBlue}o${LightRed}f${Yellow}f${LightCyan}e${LightRed}e${White}, this takes ${LightGreen}f${LightBlue}o${LightRed}r${Yellow}e${LightCyan}v${LightRed}e${LighBlue}r${White}."
echo -e "The script can be edited to include .deb, .udeb, or .debian.tar.{gz,xz,bz2} or even .dsc files, if wget command is edited."
echo -e ""
echo -e "In any case where the download keeps failing, just check fastest mirrors closest to your location and,"
echo -e "Wget itself will pick up where you left off after searching index files, if all packages are downloaded, then"
echo -e "Wget will finish and stop trying after all index.html files are searched, this is a successful clone!"
echo -e "${LightRed}#-------------------------------------\/-Message-\/---------------------------------------------------------------------#"
echo -e ${White}""
read -n 10 -p "Continue or start the wget commands? [y/n]: " answer
case ${answer} in
    y|Y )
export get="wget -A orig.tar.gz,orig.tar.xz,orig.tar.bz2 -r --level=0 -E --ignore-length -x -k -p -erobots=off -np -N -nH --cut-dirs 4 --continue --directory-prefix=${data}"
# UNCOMMENT ONE AT A TIME TO GET EVEN MORE SOURCE PACKAGES BUT PACE WGET TO AVOID HUGE DOWNLOAD TIMES
# COMMENT AND UNCOMMENT ONE URL AT A TIME IS SUGGESTED, AND ENJOY SOME GOOD COFFEE, HA HA.
#        $get $URL1
        $get $URL2
#        $get $URL3
export get="wget -A orig.tar.gz,orig.tar.xz,orig.tar.bz2 -r --level=0 -E --ignore-length -x -k -p -erobots=off -np -N -nH --cut-dirs 4 --continue --directory-prefix=${contrib}"
#        $get ${URL1}/contrib
        $get ${URL2}/contrib
#        $get ${URL3}/contrib
export get="wget -A orig.tar.gz,orig.tar.xz,orig.tar.bz2 -r --level=0 -E --ignore-length -x -k -p -erobots=off -np -N -nH --cut-dirs 4 --continue --directory-prefix=${nonfree}"
#        $get ${URL1}/non-free
        $get ${URL2}/non-free
#        $get ${URL3}/non-free
    ;;
    n|N )
          echo -e ""
          echo -e "${LightRed}OK OK: ${LightGreen}orig-wget.sh ${White}will not start, when your ready press ${Yellow}[${LightGreen}y${Yellow}]${White}, get yourself a ${LightGreen}c${LightBlue}o${LightRed}f${Yellow}f${LightCyan}e${LightRed}e${White}, this takes ${LightGreen}f${LightBlue}o${LightRed}r${Yellow}e${LightCyan}v${LightRed}e${LighBlue}r${White}."
    ;;
    * )
        echo -e ""
        echo -e "${White}Anything other then ${Yellow}[${LightGreen}y${Yellow}/${Red}n${Yellow}] ${White}will not work: ${White}You have choosen: ${LightRed}${answer} "
        echo -e "Please hit ${Yellow}[${Green}y${Yellow}] ${White}when ready, get yourself a ${LightGreen}c${LightBlue}o${LightRed}f${Yellow}f${LightCyan}e${LightRed}e${White}, this takes ${LightGreen}f${LightBlue}o${LightRed}r${Yellow}e${LightCyan}v${LightRed}e${LighBlue}r${White}."
    ;;
esac
fi