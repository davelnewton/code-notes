## Making text unselectable

This is useful beyond just being a jerk; this can also be used to make the text in SVG UX elements unselectable. While selecting that text isn't awful, it's counter-intuitive, and can be confusing.

```css
.row-of-icons {
  -webkit-user-select: none;  /* Chrome all / Safari all */
  -moz-user-select: none;     /* Firefox all */
  -ms-user-select: none;      /* IE 10+ */
  user-select: none;          /* Likely future */
}
```

## Force an entire element to be selected

This is useful for stuff like URLs or things that make no sense on their own. It's similar to making things un-selectable.

```css
.force-select {
  -webkit-user-select: all;  /* Chrome 49+ */
  -moz-user-select: all;     /* Firefox 43+ */
  -ms-user-select: all;      /* No support yet */
  user-select: all;          /* Likely future */
}
```
