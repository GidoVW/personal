# Useful binaries

### diff-so-fancy

This makes the git diffs better looking. To install:

- Export PATH to include the path to diff-so-fancy
- Add the following lines in `.bashrc` (colors look nicer):

```
# GIT DIFF
# Git diff-so-fancy script
git config --global core.pager "diff-so-fancy | less --tabs=4 -RFX"

# Git diff colors
git config --global color.ui true

git config --global color.diff-highlight.oldNormal    "red bold"
git config --global color.diff-highlight.oldHighlight "red bold 52"
git config --global color.diff-highlight.newNormal    "green bold"
git config --global color.diff-highlight.newHighlight "green bold 22"

git config --global color.diff.meta       "yellow"
git config --global color.diff.frag       "magenta bold"
git config --global color.diff.commit     "yellow bold"
git config --global color.diff.old        "red bold"
git config --global color.diff.new        "green bold"
git config --global color.diff.whitespace "red reverse"
```

Original repo: https://github.com/so-fancy/diff-so-fancy
