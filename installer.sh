# download and build Lua
curl -R -O http://www.lua.org/ftp/lua-5.4.6.tar.gz
tar zxf lua-5.4.6.tar.gz
cd lua-5.4.6
make all test

# put src/lua on the path
echo "path+=$HOME/devops/lua-5.4.6/src" > $HOME/.zshenv
source $HOME/.zshenv

cd ..
echo ""
echo "which lua // and version ... "
which lua
lua -v
