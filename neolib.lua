#!/usr/bin/env lua
--[
--[
--[
--[
--[
----------------------------------------------[START}-----------------------------------------------------

ctrl="/tmp/staging/DEBIAN/control"
t = "/tmp/staging/DEBIAN/control.tmp"
tt = "/tmp/staging/DEBIAN/control.tmp.tmp"
pkgtmp="/tmp/staging/DEBIAN/pkgtmp"
pkgtmptmp="/tmp/staging/DEBIAN/pkgtmp.tmp"

black='\027[0;30m'
red = '\027[0;31m'
green='\027[0;32m'
brownorange='\027[0;33m'
blue='\027[0;34m'
purple='\027[0;35m'
cyan='\027[0;36m'
lightgray='\027[0;37m'
darkgray='\027[1;30m'
lightred='\027[1;31m'
lightgreen='\027[1;32m'
yellow='\027[1;33m'
lightblue='\027[1;34m'
lightpurple='\027[1;35m'
lightcyan='\027[1;36m'
neg='\027[00m'

local C = {}

local function start()
exe = io.popen('./' .. build, "r")
for line in exe:lines() do
print(line)
--exe:close()
end
---[start()-end
end

local function decomp()
local bz = "ls *.tar.bz2"
local gz = "ls *.tar.gz"
local xz = "ls *.tar.xz"
cmd = "ls *.tar.*"
lsdil = io.popen(cmd .. " 2>&1", "r")
for line in lsdil:lines() do
a = line:match("(%.%w+)$")
ex = line
if(a==".bz2")
then
os.execute("tar -xvjf " .. ex)
else if(a==".gz")
then
os.execute("tar -xvf " .. ex)
else if(a==".xz")
then
os.execute("tar -xvf " .. ex)
else
print("ERROR: Cant decompress:  ", ex)
end
end
end
end
lsdil:close()
--[decomp()-end
end

local function control()
local cmd = "ls *.boxbuild"
local f = io.popen(cmd .. " 2>&1", "r")
local text = f:read "*a"
os.execute("clear")
lsdil = io.popen(cmd .. " 2>&1", "r")
for line in lsdil:lines() do
build=(line)
end
lsdil:close()
print("STARTING-------------------------->>")
print("____________________________________________________________________")
os.execute('echo USER: $(whoami)')
os.execute('echo CWD: $(pwd)')
print("PKGBUILD:   ", build)
print("____________________________________________________________________")

--[ PART1
--================================
php = io.open(build, "r")
ctr = io.open(tt, "w")
io.input(php)
io.output(ctr)
line1 = php:read()
ctr:write(line1.gsub(line1, '\"', ' '), "\n")
line2 = php:read()
ctr:write(line2.gsub(line2, '\"', ' '), "\n")
line3 = php:read()
ctr:write(line3.gsub(line3, '\"', ' '), "\n")
line4 = php:read()
ctr:write(line4.gsub(line4, '\"', ' '), "\n")
line5 = php:read()
ctr:write(line5.gsub(line5, '\"', ' '), "\n")
line6 = php:read()
ctr:write(line6.gsub(line6, '\"', ' '), "\n")
line7 = php:read()
ctr:write(line7.gsub(line7, '\"', ' '), "\n")
line8 = php:read()
ctr:write(line8.gsub(line8, '\"', ' '), "\n")
line9 = php:read()
ctr:write(line9.gsub(line9, '\"', ' '), "\n")
line10 = php:read()
ctr:write(line10.gsub(line10, '\"', ' '), "\n")
line11 = php:read()
ctr:write(line11.gsub(line11, '\"', ' '), "\n")
line12 = php:read()
ctr:write(line12.gsub(line12, '\"', ' '), "\n")
line13 = php:read()
ctr:write(line13.gsub(line13, '\"', ' '), "\n")
line14 = php:read()
ctr:write(line14.gsub(line14, '\"', ' '), "\n")
line15 = php:read()
ctr:write(line15.gsub(line15, '\"', ' '), "\n")
line16 = php:read()
ctr:write(line16.gsub(line16, '\"', ' '), "\n")
php:close()
ctr:close()
--[ PART2
--================================
file = io.open(tt, "r")
ct = io.open(t, "w")
io.input(file)
io.output(ct)
line1 = file:read()
ct:write(line1, "\n")
line2 = file:read()
ct:write(line2, "\n")
line3 = file:read()
ct:write(line3, "\n")
line4 = file:read()
ct:write(line4, "\n")
line5 = file:read()
ct:write(line5, "\n")
line6 = file:read()
ct:write(line6, "\n")
line7 = file:read()
ct:write(line7, "\n")
line8 = file:read()
ct:write(line8, "\n")
line9 = file:read()
ct:write(line9.gsub(line9, "_", "-"), "\n")
line10 = file:read()
ct:write(line10, "\n")
line11 = file:read()
ct:write(line11.gsub(line11, "_", "-"), "\n")
line12 = file:read()
ct:write(line12.gsub(line12, "_", "-"), "\n")
line13 = file:read()
ct:write(line13, "\n")
line14 = file:read()
ct:write(line14, "\n")
line15 = file:read()
ct:write(line15, "\n")
line16 = file:read()
ct:write(line16, "\n")
file:close()
ct:close()
--[ PART3
--================================
thc = io.open(t, "r")
tr = io.open(ctrl, "w")
io.input(thc)
io.output(tr)
line1 = thc:read()
tr:write(line1.gsub(line1, '=', ':'), "\n")
line2 = thc:read()
tr:write(line2.gsub(line2, '=', ':'), "\n")
line3 = thc:read()
tr:write(line3.gsub(line3, '=', ':'), "\n")
line4 = thc:read()
tr:write(line4.gsub(line4, '=', ':'), "\n")
line5 = thc:read()
tr:write(line5.gsub(line5, '=', ':'), "\n")
line6 = thc:read()
tr:write(line6.gsub(line6, '=', ':'), "\n")
line7 = thc:read()
tr:write(line7.gsub(line7, '=', ':'), "\n")
line8 = thc:read()
tr:write(line8.gsub(line8, '=', ':'), "\n")
line9 = thc:read()
tr:write(line9.gsub(line9, '=', ':'), "\n")
line10 = thc:read()
tr:write(line10.gsub(line10, '=', ':'), "\n")
line11 = thc:read()
tr:write(line11.gsub(line11, '=', ':'), "\n")
line12 = thc:read()
tr:write(line12.gsub(line12, '=', ':'), "\n")
line13 = thc:read()
tr:write(line13.gsub(line13, '=', ':'), "\n")
line14 = thc:read()
tr:write(line14.gsub(line14, '=', ':'), "\n")
line15 = thc:read()
tr:write(line15.gsub(line15, '=', ':'), "\n")
line16 = thc:read()
tr:write(line16.gsub(line16, '=', ':'), "\n")
thc:close()
tr:close()
--[ PART4
--================================
weed = io.open(ctrl, "r")
beer = io.open(pkgtmptmp, "w")
io.input(weed)
io.output(beer)
line1 = weed:read()
beer:write(line1.gsub(line1, 'Package: ', ''), "\n")
line2 = weed:read()
beer:write(line2.gsub(line2, 'Version: ', ''), "\n")
line3 = weed:read()
beer:write(line3.gsub(line3, 'Section: ', ''), "\n")
line4 = weed:read()
beer:write(line4.gsub(line4, 'Priority: ', ''), "\n")
line5 = weed:read()
beer:write(line5.gsub(line5, 'Architecture: ', ''), "\n")
line6 = weed:read()
beer:write(line6.gsub(line6, 'Maintainer: ', ''), "\n")
line7 = weed:read()
beer:write(line7.gsub(line7, 'Conflicts: ', ''), "\n")
line8 = weed:read()
beer:write(line8.gsub(line8, 'Breaks: ', ''), "\n")
line9 = weed:read()
beer:write(line9.gsub(line9, 'Pre-Depends: ', ''), "\n")
line10 = weed:read()
beer:write(line10.gsub(line10, 'Depends: ', ''), "\n")
line11 = weed:read()
beer:write(line11.gsub(line11, 'Build-Depends: ', ''), "\n")
line12 = weed:read()
beer:write(line12.gsub(line12, 'Built-Using: ', ''), "\n")
line13 = weed:read()
beer:write(line13.gsub(line13, 'Enhances: ', ''), "\n")
line14 = weed:read()
beer:write(line14.gsub(line14, 'Description: ', ''), "\n")
line15 = weed:read()
beer:write(line15.gsub(line15, 'Source: ', ''), "\n")
line16 = weed:read()
beer:write(line16.gsub(line16, 'Homepage: ', ''), "\n")
weed:close()
beer:close()
--[ PART5
--================================
trim = io.open(pkgtmptmp, "r")
fix = io.open(pkgtmp, "w")
io.input(trim)
io.output(fix)
line1 = trim:read()
fix:write(line1.gsub(line1, "^%s*(.-)%s*$", "%1"), "\n")
line2 = trim:read()
fix:write(line2.gsub(line2, "^%s*(.-)%s*$", "%1"), "\n")
line3 = trim:read()
fix:write(line3.gsub(line3, "^%s*(.-)%s*$", "%1"), "\n")
line4 = trim:read()
fix:write(line4.gsub(line4, "^%s*(.-)%s*$", "%1"), "\n")
line5 = trim:read()
fix:write(line5.gsub(line5, "^%s*(.-)%s*$", "%1"), "\n")
line6 = trim:read()
fix:write(line6.gsub(line6, "^%s*(.-)%s*$", "%1"), "\n")
line7 = trim:read()
fix:write(line7.gsub(line7, "^%s*(.-)%s*$", "%1"), "\n")
line8 = trim:read()
fix:write(line8.gsub(line8, "^%s*(.-)%s*$", "%1"), "\n")
line9 = trim:read()
fix:write(line9.gsub(line9, "^%s*(.-)%s*$", "%1"), "\n")
line10 = trim:read()
fix:write(line10.gsub(line10, "^%s*(.-)%s*$", "%1"), "\n")
line11 = trim:read()
fix:write(line11.gsub(line11, "^%s*(.-)%s*$", "%1"), "\n")
line12 = trim:read()
fix:write(line12.gsub(line12, "^%s*(.-)%s*$", "%1"), "\n")
line13 = trim:read()
fix:write(line13.gsub(line13, "^%s*(.-)%s*$", "%1"), "\n")
line14 = trim:read()
fix:write(line14.gsub(line14, "^%s*(.-)%s*$", "%1"), "\n")
line15 = trim:read()
fix:write(line15.gsub(line15, "^%s*(.-)%s*$", "%1"), "\n")
line16 = trim:read()
fix:write(line16.gsub(line16, "^%s*(.-)%s*$", "%1"), "\n")
trim:close()
fix:close()
-----
opens = io.open(pkgtmp, "r")
io.input(opens)
line1 = opens:read()
line2 = opens:read()
line3 = opens:read()
line4 = opens:read()
line5 = opens:read()
line6 = opens:read()
line7 = opens:read()
line8 = opens:read()
line9 = opens:read()
line10 = opens:read()
line11 = opens:read()
line12 = opens:read()
line13 = opens:read()
line14 = opens:read()
line15 = opens:read()
line16 = opens:read()
pkgdir=(line1 .. '-' .. line2)
pkg=(line1 .. '-' .. line2 .. '-' .. line5 .. '.deb')
url=(line16)
opens:close()
print("pkgname is:", pkg)
print("url is:", url)
os.execute("rm " .. t)
os.execute("rm " .. tt)
os.execute("rm " .. pkgtmp)
os.execute("rm " .. pkgtmptmp)
--[control()-end
end
C.start = start
C.decomp = decomp
C.control = control
return C
----------------------------------------------[END}-------------------------------------------------------
