
function exit_on_error()
{
if [ $? -ne 0 ];then 
exit
fi
}

V=$1

if [ "$V" == "" -o ! -f "cpputest-$V.tar.gz" ] ;then
echo "missing file cpputest-$V" 
exit
fi

# Prepare environment
rm -fr arm-linux
rm -rf cpputest-$V

tar -xf cpputest-$V.tar.gz
cd cpputest-$V
exit_on_error

export PATH=/opt/OSELAS.Toolchain-2012.12.1/arm-cortexa9-linux-gnueabihf/gcc-4.7.3-glibc-2.16.0-binutils-2.22-kernel-3.6-sanitized/bin:$PATH

# Build package
./configure --with-sysroot=/opt/OSELAS.Toolchain-2012.12.1/arm-cortexa9-linux-gnueabihf/gcc-4.7.3-glibc-2.16.0-binutils-2.22-kernel-3.6-sanitized/bin/ --host=arm-cortexa9-linux-gnueabihf --enable-std-cpp11
exit_on_error

make
exit_on_error

# Install package
cd ..
mkdir arm-linux
exit_on_error

cp -axr cpputest-$V/include arm-linux
cp -axr -f cpputest-$V/lib arm-linux

#clean up
rm -fr arm-linux/include/Platforms/
rm arm-linux/lib/NoteOnVisualStudio.txt 
rm arm-linux/lib/.dirstamp
rm -fr cpputest-$V 





