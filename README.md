## Clone this repo
```
git -c core.sshCommand="ssh -i ~/.ssh/GITHUB_MY_SSH_KEY" \
clone git@github.com:samyankc/dotfiles.git
```

## Apply config
```
stow --abdopt <package_name>;
git restore;
```
