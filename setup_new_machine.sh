
#Install oh my zsh
echo "Installing oh_my_zsh..."
sh -c "$(curl -fsSL https://raw.githubusercontent.com/robbyrussell/oh-my-zsh/master/tools/install.sh)"

echo "Copying zshrc"
cp .zshrc ~/.zshrc

echo "Copying vimrc"
cp .vimrc ~/.vimrc

echo "Copying tmuxconf"
cp .tmux.conf ~/.tmux.conf 

cp ack-2.14-single-file ~/opt/bin 

mkdir ~/opt
cp mybin/* ~/opt/bin 

echo "Done! : Dont forget to run :PluginInstall in vim"
echo "Get vimplug"

