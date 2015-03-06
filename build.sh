
function exit_on_error()
{
if [ $? -ne 0 ];then 
exit
fi
}

# Build package
./autogen.sh
./configure --enable-std-cpp11
exit_on_error
make
exit_on_error

exit

# Install package

#clean up
rm -fr x86-linux/include/Platforms/
rm x86-linux/lib/NoteOnVisualStudio.txt 
rm x86-linux/lib/.dirstamp 
rm -rf cpputest-$V


