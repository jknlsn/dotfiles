# dotfiles

## Usage

Install brew and git

Git bare clone the repo
`git clone --bare git@gitlab.com:jknlsn/dotfiles.git $HOME/.dotfiles`

Pull the files
`/usr/bin/git --git-dir=$HOME/.dotfiles/ --work-tree=$HOME pull`

Source the zshrc config
`source .zshrc`

From now on can use `dotfiles` commands to install brew packages or to update the list of installed brew packages and sync it:

- `dotfiles update`
- `dotfiles install`

Add dot files to the repo with commands

`dotfiles add .filename`
`dotfiles commit -m "Added filename"`
`dotfiles push`
