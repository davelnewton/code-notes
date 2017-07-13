<!-- TOC depthFrom:1 depthTo:6 withLinks:1 updateOnSave:1 orderedList:0 -->

	- [Issues](#issues)
		- [Searching Issues](#searching-issues)
		- [Labels](#labels)
	- [Configuring a fork's remote repo](#configuring-a-forks-remote-repo)
		- [List current remotes](#list-current-remotes)
		- [Add upstream remote (the repo you forked)](#add-upstream-remote-the-repo-you-forked)
		- [Removing remote](#removing-remote)
		- [Syncing with upstream repo](#syncing-with-upstream-repo)

<!-- /TOC -->

## Issues

### Searching Issues

https://help.github.com/articles/searching-issues/

### Labels

https://medium.com/@dave_lunny/sane-github-labels-c5d2e6004b63

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
