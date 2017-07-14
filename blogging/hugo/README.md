<!-- TOC depthFrom:1 depthTo:6 withLinks:1 updateOnSave:1 orderedList:0 -->

- [Hugo](#hugo)
	- [Quick-quick-start](#quick-quick-start)
		- [Generating blog and a post, running local server:](#generating-blog-and-a-post-running-local-server)
- [File name used as title but can change in front matter](#file-name-used-as-title-but-can-change-in-front-matter)
		- [Publishing to GH Pages; from within `public` directory of blog:](#publishing-to-gh-pages-from-within-public-directory-of-blog)
	- [Themes](#themes)

<!-- /TOC -->

# Hugo

## Quick-quick-start

### Generating blog and a post, running local server:

```
$ hugo new site BLOG_NAME_DIR
$ cd BLOG_NAME_DIR

# File name used as title but can change in front matter
$ hugo new post/20170714-sample-post-1.md      
$ hugo server --theme=THEME_NAME --buildDrafts
```

### Publishing to GH Pages; from within `public` directory of blog:

```
➜  public git:(gh-pages) (cd ..; hugo)
➜  public git:(gh-pages) ga .
➜  public git:(gh-pages) gc -m "whatevs"
➜  public git:(gh-pages) git push -f origin gh-pages
```

## Themes

https://themes.gohugo.io/
