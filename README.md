## Apply config without clone
```
curl -L -o $HOME/dotfiles.tar.gz https://github.com/samyankc/dotfiles/archive/refs/heads/main.tar.gz && \
\mkdir -p $HOME/dotfiles-tmp && \
tar -xf $HOME/dotfiles.tar.gz -C $HOME/dotfiles-tmp --strip-components=1 && \
\cp -rf $HOME/dotfiles-tmp $HOME/dotfiles
\ls -p1 $HOME/dotfiles | grep -e '/$' | sed 's/\///' | xargs -n1 stow --adopt
\mv -rf $HOME/dotfiles-tmp $HOME/dotfiles
```


## Clone this repo
```
git -c core.sshCommand="ssh -i ~/.ssh/GITHUB_MY_SSH_KEY" \
clone git@github.com:samyankc/dotfiles.git;
cd dotfiles;
git config core.sshCommand "ssh -i ~/.ssh/GITHUB_MY_SSH_KEY";
```

## Apply config
```
cd ~/dotfiles;
'ls' -md */ | sed -E 's/\/,?//g' | xargs -n1 stow --adopt ;
git restore .;
```

