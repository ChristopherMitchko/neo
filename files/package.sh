
export cwd=$(pwd)
export builddir="/tmp/building"
export staging="/tmp/staging"
export installdir="/tmp/install"
export builddir="/tmp/building/"
export staging="/tmp/staging/"
export debian="/tmp/staging/DEBIAN/"
export installdir="/tmp/install/"
export data="data.tar.gz"

start() {
	rm -rf ${builddir}* ${staging}* ${debian}* ${installdir}*
	cd $cwd
	mkdir -p ${builddir}* ${staging}* ${debian}* ${installdir}*
}
start

package() {
	cd $installdir
	tar -zvcf ${staging}${data} ./
	cd ${debian}
	tar -zvcf ${staging}control.tar.gz ./
	cd $staging
	echo 2.0 > debian-binary
	ar -rv ${cwd}/${Package}-${Version}-${Architecture}.deb debian-binary control.tar.gz data.tar.gz
}



