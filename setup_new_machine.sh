
#Install oh my zsh
echo "Installing oh_my_zsh..."
sh -c "$(curl -fsSL https://raw.githubusercontent.com/robbyrussell/oh-my-zsh/master/tools/install.sh)"

echo "Copying zshrc"
cp myzshrc ~/.zshrc

echo "Getting Vundle..."
git clone https://github.com/VundleVim/Vundle.vim.git ~/.vim/bundle/Vundle.vim

echo "Copying vimrc"
cp .vimrc ~/.vimrc

echo "Done! : Dont forget to run :PluginInstall in vim"
