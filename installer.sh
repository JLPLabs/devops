# download and build Lua
curl -R -O http://www.lua.org/ftp/lua-5.4.6.tar.gz
tar zxf lua-5.4.6.tar.gz
cd lua-5.4.6
make all test
cd ..

# put src/lua on the path
echo "path+=$HOME/devops/lua-5.4.6/src" > $HOME/.zshenv

# get luatweetnacl and build
curl -L  -o luatweetnacl.master.zip http://github.com/philanc/luatweetnacl/zipball/master/
unzip luatweetnacl.master.zip
cd philanc-luatweetnacl-9507d35
LUADIR=$HOME/devops/lua-5.4.6/src LUA=$HOME/devops/lua-5.4.6/src LUAINC=$HOME/devops/lua-5.4.6/src make



# launch new window (macos)
osascript -e 'tell app "Terminal" to do script "echo $path"'
