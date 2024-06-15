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
