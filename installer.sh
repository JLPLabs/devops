# download and build Lua
curl -R -O http://www.lua.org/ftp/lua-5.4.6.tar.gz
tar zxf lua-5.4.6.tar.gz
cd lua-5.4.6
make all test
cd ..

# put src/lua on the path
echo "path+=$HOME/devops/lua-5.4.6/src" > $HOME/.zshenv
source $HOME/.zshenv

# get luatweetnacl and build
curl -L  -o luatweetnacl.master.zip http://github.com/philanc/luatweetnacl/zipball/master/
unzip luatweetnacl.master.zip
cp luatweetnacl_makefile philanc-luatweetnacl-9507d35/Makefile
cd philanc-luatweetnacl-9507d35
make
cp luatweetnacl.so ../lua-5.4.6/src/.
cd ../lua-5.4.6/src


##### NOTE  #####
# the make file luatweetnacl needs to be changed to link correctly on macos
# need to use 'bundle' and 'bundle_loader' and path to Lua interpreter
# e.g., gcc -bundle -bundle_loader /usr/local/bin/lua -o monlib.so monlib.o

# see instructions for making the library on macos...
# http://lua-users.org/lists/lua-l/2022-10/msg00057.html
#################


# launch new window (macos)
#osascript -e 'tell app "Terminal" to do script "echo $path"'
