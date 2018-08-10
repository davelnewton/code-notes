<!-- TOC depthFrom:1 depthTo:6 withLinks:1 updateOnSave:1 orderedList:0 -->

- [Git/GitHub Stuff](#gitgithub-stuff)
	- [Aliases](#aliases)
	- [Issues](#issues)
		- [Closing via comments](#closing-via-comments)
		- [Searching Issues](#searching-issues)
		- [Labels](#labels)
	- [Configuring a fork's remote repo](#configuring-a-forks-remote-repo)
		- [List current remotes](#list-current-remotes)
		- [Add upstream remote (the repo you forked)](#add-upstream-remote-the-repo-you-forked)
		- [Removing remote](#removing-remote)
		- [Syncing with upstream repo](#syncing-with-upstream-repo)
	- [Utils](#utils)
		- [See which branch(es) contain a commit or rev](#see-which-branches-contain-a-commit-or-rev)
		- [Get current branch name](#get-current-branch-name)
		- [List all files in a commit](#list-all-files-in-a-commit)

<!-- /TOC -->

# Git/GitHub Stuff

## Aliases

`git config --global alias.co checkout`

## Issues

### Closing via comments

https://help.github.com/articles/closing-issues-using-keywords/

The following keywords, followed by an issue number, will close the issue:

* close
* closes
* closed
* fix
* fixes
* fixed
* resolve
* resolves
* resolved

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

## Utils

### See which branch(es) contain a commit or rev

https://stackoverflow.com/questions/27167584/how-to-get-list-of-all-branches-created-off-a-git-branch-get-all-sub-branches-o

```
$ git branch --contains $SHA
$ git branch --contains $BRANCH_NAME
# Remote
$ git branch -r --contains $SHA
```

### Get current branch name

`git rev-parse --abbrev-ref HEAD`

### List all files in a commit

https://stackoverflow.com/questions/424071/how-to-list-all-the-files-in-a-commit

```
$ git diff-tree --no-commit-id --name-only -r bd61ad98
index.html
javascript/application.js
javascript/ie6.js
```

user-facing:

```
$ git show --pretty="" --name-only bd61ad98
index.html
javascript/application.js
javascript/ie6.js
```
