# NodeJS Notes

https://nodejs.org/de/docs/guides/debugging-getting-started/

## File IO

Sync or async is available through `fs`.

### Read entire file

```js
import fs from 'fs'

const fileContent = fs.readFileAsync(fileName, encoding)
```

If `encoding` is not provided (e.g., `utf8`) the file content will be a buffer. If encoding is present (unsure if it needs to be "right") it'll be returned as a string.

```js
import fs from 'fs'

fs.readFile(fileName, encoding, (err, data) => {
  // As async example.
})
```
