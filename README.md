# dotfiles
Personal dotfiles

## How to update
```bash
mkdir $HOME/.dotfiles
git init --bare $HOME/.dotfiles
alias dotfiles='/usr/local/bin/git --git-dir=$HOME/.dotfiles/ --work-tree=$HOME'
dotfiles config --local status.showUntrackedFiles no
dotfiles remote add origin git@github.com:ClintonSoll/dotfiles.git
dotfiles pull
```

## How to just pull the newest dotfiles
```bash
git clone --separate-git-dir=$HOME/.dotfiles https://github.com/ClintonSoll/dotfiles.git tmpdotfiles
rsync --recursive --verbose --exclude '.git' tmpdotfiles/ $HOME/
rm -r tmpdotfiles
```
