#!/bin/bash
set -e

############################################################################### VARIABLES
package="antanilipsum"

############################################################################### FUNCTIONS
safetyCheck(){
if [ ! -f build.sh ]; then echo '[KO] Please `cd` in the "build" directory, don`t run this script from other folders' && exit 1; fi
if [ -d dist ]; then rm -r dist; fi
if [ -d buildfiles ]; then rm -r buildfiles; fi
cp ../sources/template.dtx $package.dtx
}

paragraphSubstitution(){
for sourcefile in ../sources/par* ; do
    parNumber=$(($parNumber + $(grep -c '[^[:space:]]' $sourcefile)))
done
sed '/^\s*$/d; s/^/\\@@_newpara:n {/g; s/[A-Za-z]*$/}\n&/g' ../sources/par* | fold -w 80 -s  > $package.txt.tmp
sed -e '/%replacemewithparagraphs/ {' -e "r $package.txt.tmp" -e 'd' -e '}' -i $package.dtx
echo "[OK] Replaced paragraphs"
}

wordSubstitution(){
wordNumber=$(grep -c '[^[:space:]]' ../sources/words.txt)
sed 's/^/\\@@_newword:n {/g; s/$/}/g' ../sources/words.txt > $package.txt.tmp
sed -e '/%replacemewithwords/ {' -e "r $package.txt.tmp" -e 'd' -e '}' -i $package.dtx
echo "[OK] Replaced words"
}

compilation(){
#using lualatex because with pdflatex it is possible to encounter the following error: "TeX capacity exceeded, sorry [main memory size=5000000]"
lualatex $package.dtx && echo " "
#lualatex $package.dtx > /dev/null # commented out because missing dependencies are not reported in stderr, if everything works you can use this command to suppress stdout
echo "[OK] Compiled $package"
}

cleanup(){
mkdir dist
mkdir buildfiles

distfiles=(
$package.dtx
$package.pdf
$package.sty
README.md
)

buildfiles=(
$package.aux
$package.glo 
$package.hd 
$package.idx 
$package.ins 
$package.log 
$package.txt.tmp
)

if [ -d dist ]; then 
    for file in ${distfiles[@]}; do 
        if [ -f $file ]; then
            mv $file dist/
        fi
    done
fi

if [ -d buildfiles/ ]; then 
    for file in ${buildfiles[@]}; do 
        if [ -f $file ]; then
            mv $file buildfiles/
        fi
    done
fi
echo "[OK] Cleaned up"
}

############################################################################### COMMANDS
safetyCheck
paragraphSubstitution
wordSubstitution
compilation
cleanup
echo "[OK] $parNumber paragraphs and $wordNumber words are available"