
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
rm -fr x86-linux
rm -rf cpputest-$V

tar -xf cpputest-$V.tar.gz
cd cpputest-$V
exit_on_error

# Build package
./configure --enable-std-cpp11
exit_on_error
make
exit_on_error

# Install package
cd ..
mkdir x86-linux
exit_on_error

cp -axr cpputest-$V/include x86-linux
cp -axr -f cpputest-$V/lib x86-linux

#clean up
rm -fr x86-linux/include/Platforms/
rm x86-linux/lib/NoteOnVisualStudio.txt 
rm x86-linux/lib/.dirstamp 
rm -rf cpputest-$V


