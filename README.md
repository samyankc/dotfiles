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
ls 
stow --abdopt <package_name>;
git restore;
```
