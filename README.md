# dotfiles

## Usage

Install xcode command line tools.

Then install homebrew and zinit.

1. `/bin/bash -c "$(curl -fsSL https://raw.githubusercontent.com/Homebrew/install/HEAD/install.sh)"`
2. `sh -c "$(curl -fsSL https://raw.githubusercontent.com/zdharma/zinit/master/doc/install.sh)"`

Git bare clone the repo
`git clone --bare git@gitlab.com:jknlsn/dotfiles.git $HOME/.dotfiles`

Pull the files
`/usr/bin/git --git-dir=$HOME/.dotfiles/ --work-tree=$HOME pull`

Source the zshrc config
`source .zshrc`

From now on can use `dfm` commands to install brew packages or to update the list of installed brew packages and sync it to this repo.
