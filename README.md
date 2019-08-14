# dotfiles
Personal dotfiles

## How to update
Run the following commands on the host server.
```shell
mkdir $HOME/.dotfiles
git init --bare $HOME/.dotfiles
alias dotfiles='/usr/bin/git --git-dir=$HOME/.dotfiles/ --work-tree=$HOME'
dotfiles config --local status.showUntrackedFiles no
dotfiles remote add origin git@github.com:ClintonSoll/dotfiles.git
dotfiles config --global user.email {EMAIL}
```
This will prepare the server to become a host.

Run an ssh-keygen and get the public key to add as a key here.
```shell
ssh-keygen
cat ~/.ssh/id_rsa.pub
```
Copy the cat output. On the repo go to Settings > Deploy Keys > Add a Deploy Key.
Give the key a name and paste the output from the id_rsa.pub file into the key. Check the box to allow write access for push if needed.

```shell
dotfiles checkout master
dotfiles pull
```

## How to just pull the newest dotfiles without becoming a host
```shell
git clone --separate-git-dir=$HOME/.dotfiles https://github.com/ClintonSoll/dotfiles.git tmpdotfiles
rsync --recursive --verbose --exclude '.git' tmpdotfiles/ $HOME/
rm -r tmpdotfiles
```
