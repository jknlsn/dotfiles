# dotfiles

## Usage

Install xcode command line tools, homebrew and zinit.

```
xcode-select --install
/bin/bash -c "$(curl -fsSL https://raw.githubusercontent.com/Homebrew/install/HEAD/install.sh)"
bash -c "$(curl --fail --show-error --silent --location https://raw.githubusercontent.com/zdharma-continuum/zinit/HEAD/scripts/install.sh)"
```

Pull the files down and configure this repo.

```
git clone --bare git@github.com:jknlsn/dotfiles.git $HOME/.dotfiles
git --git-dir=$HOME/.dotfiles/ config core.bare false
git --git-dir=$HOME/.dotfiles/ config core.worktree $HOME
git --git-dir=$HOME/.dotfiles/ checkout -f
cd $HOME/.dotfiles/
git push --set-upstream origin main
cd $HOME
```

Source the zshrc config.
`source .zshrc`

From now on can use `dfm` commands to install brew packages or to update the list of installed brew packages and sync it to this repo.

The first time that you push from a new installation, you will need to set the upstream. The first `dfm update` will fail, but it will record any changes you've made to brew installs etc.

```
dfm update
cd /.dotfiles
git push --set-upstream origin main
```

## Notes

Inspired by [https://github.com/kalkayan/dotfiles](https://github.com/kalkayan/dotfiles).
