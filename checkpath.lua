#!/usr/bin/env lua
--[
--[
--[
--[
--[
--[
if  0 == os.execute("uname -a") then
    local t = "test"
end
print('\27[0;31m______________________________________________________\27[1;00m')
print("\27[0;36mLua Setup Starting: Printing Module Path=\27[1;00m")
print("LUA MODULES:\n",(package.path:gsub("%;","\n\t")),"\n\nC MODULES:\n",(package.cpath:gsub("%;","\n\t")))
print('\27[0;31m______________________________________________________\27[1;00m')

os.execute("luarocks install luafilesystem")
os.execute("luarocks install --server=http://luarocks.org/dev luash ")

----------------------------------------------[END}-------------------------------------------------------
