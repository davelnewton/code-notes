# Git Stuff

## Configuring a fork's remote repo

From: https://help.github.com/articles/configuring-a-remote-for-a-fork/

### List current remotes

```
$ git remote -v
origin  https://github.com/YOUR_USERNAME/YOUR_FORK.git (fetch)
origin  https://github.com/YOUR_USERNAME/YOUR_FORK.git (push)
```

### Add upstream remote (the repo you forked)

```
$ git remote add upstream https://github.com/ORIGINAL_OWNER/ORIGINAL_REPOSITORY.git
```

### Removing remote

The remotes' names are the first column from `git remote -v`

```
$ git remote rm upstream
$ git remote -v
origin  https://github.com/YOUR_USERNAME/YOUR_FORK.git (fetch)
origin  https://github.com/YOUR_USERNAME/YOUR_FORK.git (push)
```

### Syncing with upstream repo

```
$ git fetch upstream
$ git checkout master
$ git merge upstream/master
```
