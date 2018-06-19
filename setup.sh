# installing colorout
git clone https://github.com/jalvesaq/colorout.git
R CMD INSTALL colorout

# install powerline fonts required for vim airline
# clone
git clone https://github.com/powerline/fonts.git --depth=1
# install
cd fonts
./install.sh
# clean-up a bit
cd ..
rm -rf fonts


