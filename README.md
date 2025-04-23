## Apply config without clone
```
DF=$HOME/dotfiles; \
curl -L -o $DF.tar.gz https://github.com/samyankc/dotfiles/archive/refs/heads/main.tar.gz && \
\mkdir -p $DF && \
tar -xf $DF.tar.gz -C $DF --strip-components=1 && \
\rm -rf $DF.copy && \
\cp -rf $DF $DF.copy && \
\ls -d $DF/*/ | xargs -n 1 basename | xargs stow -t $HOME -d $DF --adopt && \
\rm -rf $DF $DF.tar.gz && \
\mv -f $DF.copy $DF \
;unset DF
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

