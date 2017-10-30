# NPM Notes

## `npm link` issues

* https://docs.npmjs.com/cli/link
* https://docs.npmjs.com/misc/scope
* https://github.com/npm/npm/issues/5875
* https://docs.npmjs.com/files/package.json#peerdependencies

## Dependency Tree

```
$ npm ll
$CURRENT_PROJECT@$CURRENT_VERSION
│ $CURRENT_DIR
│ $PROJECT_DESCRIPTION
├─┬ autoprefixer@6.7.3
│ │ Parse CSS and add vendor prefixes to CSS rules using values from the Can I Use website
│ │ git+https://github.com/postcss/autoprefixer.git
│ │ https://github.com/postcss/autoprefixer#readme
│ ├─┬ browserslist@1.7.3
│ │ │ Share browsers list between different front-end tools, like Autoprefixer, Stylelint and babel-env-preset
│ │ │ git+https://github.com/ai/browserslist.git
│ │ │ https://github.com/ai/browserslist#readme
...etc...
```

Non-verbose:

```
$ npm list
$CURRENT_PROJECT@$CURRENT_VERSION $CURRENT_DIR
├─┬ autoprefixer@6.7.3
│ ├─┬ browserslist@1.7.3
│ │ └── electron-to-chromium@1.2.2
│ ├── caniuse-db@1.0.30000623
│ ├── normalize-range@0.1.2
│ ├── num2fraction@1.2.2
```
