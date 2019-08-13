# dotfiles
Personal dotfiles

## How to update
1. mkdir $HOME/.dotfiles
2. git init --bare $HOME/.dotfiles
3. alias dotfiles='/usr/local/bin/git --git-dir=$HOME/.dotfiles/ --work-tree=$HOME'
4. dotfiles config --local status.showUntrackedFiles no
5. dotfiles remote add origin git@github.com:ClintonSoll/dotfiles.git
6. dotfiles pull

## How to just pull the newest dotfiles
1. git clone --separate-git-dir=$HOME/.dotfiles https://github.com/ClintonSoll/dotfiles.git tmpdotfiles
2. rsync --recursive --verbose --exclude '.git' tmpdotfiles/ $HOME/
3. rm -r tmpdotfiles
