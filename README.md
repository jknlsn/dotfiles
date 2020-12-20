# dotfiles

## Usage

Install brew and git

Git bare clone the repo
`git clone --bare git@gitlab.com:jknlsn/dotfiles.git $HOME/.dotfiles`

Pull the files
`/usr/bin/git --git-dir=$HOME/.dotfiles/ --work-tree=$HOME pull`
