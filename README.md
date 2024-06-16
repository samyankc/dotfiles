## Apply config without clone
```
curl -L -o $HOME/dotfiles.tar.gz https://github.com/samyankc/dotfiles/archive/refs/heads/main.tar.gz && \
\mkdir -p $HOME/dotfiles && \
tar --overwrite -xf $HOME/dotfiles.tar.gz -C $HOME/dotfiles --strip-components=1 && \
\cp -rfT $HOME/dotfiles $HOME/dotfiles.copy && \
\ls -p1 $HOME/dotfiles | grep -e '/$' | sed 's/\///' | xargs -n1 stow -d $HOME/dotfiles --adopt && \
\rm -rf $HOME/dotfiles $HOME/dotfiles.tar.gz && \
\mv -Tf $HOME/dotfiles.copy $HOME/dotfiles
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

