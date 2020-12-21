# dotfiles

## Usage

Install xcode command line tools, homebrew and zinit.

```
xcode-select --install
/bin/bash -c "$(curl -fsSL https://raw.githubusercontent.com/Homebrew/install/HEAD/install.sh)"
sh -c "$(curl -fsSL https://raw.githubusercontent.com/zdharma/zinit/master/doc/install.sh)"
```

Pull the files down and configure this repo.

```
git clone --bare git@github.com:jknlsn/dotfiles.git $HOME/.dotfiles
git --git-dir=$HOME/.dotfiles/ config core.bare false
git --git-dir=$HOME/.dotfiles/ config core.worktree $HOME
git --git-dir=$HOME/.dotfiles/ checkout -f
```

Source the zshrc config.
`source .zshrc`

From now on can use `dfm` commands to install brew packages or to update the list of installed brew packages and sync it to this repo.

## Notes

Inspired by [https://github.com/kalkayan/dotfiles](https://github.com/kalkayan/dotfiles).
