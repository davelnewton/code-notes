# MDN Links

* [Destructuring assignment](https://developer.mozilla.org/en-US/docs/Web/JavaScript/Reference/Operators/Destructuring_assignment)

# Useful Libraries

| What | Where | More |
| ---- | ----- | ---- |
| Strings | http://stringjs.com | |
| Cookies | https://github.com/reactivestack/cookies | |
| Validation | https://validatejs.org/#validators-length | |

# Misc

## Logging

```js
const logStyles = {
  errorHeader: {
    color:            'black',
    background:        'salmon',
    'font-weight':    'bold',
    'border-bottom':  '1px dotted black',
    'border-top':     '1px dotted black',
    'padding-top':    '4px',
    'padding-bottom': '4px',
  },

  errorText: {
    color: 'black',
  },
}

const errorCssHeader = Object.keys(logStyles.errorHeader).map(cssProp => `${cssProp}: ${logStyles.errorHeader[cssProp]}`).join('; ')
const errorCssText = Object.keys(logStyles.errorText).map(cssProp => `${cssProp}: ${logStyles.errorText[cssProp]}`).join('; ')

const tmp = 'Pretend I\'m an error message.'
console.log(`%c %s %c ${tmp}`, errorCssHeader, '<Something#render() />', errorCssText)
```
