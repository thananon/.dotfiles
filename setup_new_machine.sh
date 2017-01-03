curl -fLo ~/.vim/autoload/plug.vim --create-dirs \
         https://raw.githubusercontent.com/junegunn/vim-plug/master/plug.vim

git clone --depth 1 https://github.com/junegunn/fzf.git ~/.fzf

~/.fzf/install
#Install oh my zsh
echo "Installing oh_my_zsh..."
sh -c "$(curl -fsSL https://raw.githubusercontent.com/robbyrussell/oh-my-zsh/master/tools/install.sh)"

echo "Copying zshrc"
cp .zshrc ~/.zshrc

echo "Copying vimrc"
cp .vimrc ~/.vimrc

echo "Copying tmuxconf"
cp .tmux.conf ~/.tmux.conf 


mkdir ~/opt
cp mybin/* ~/opt/bin 

echo "Done! : Dont forget to run :PlugInstall in vim"

