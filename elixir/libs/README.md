# Useful Libraries

## GUID

https://github.com/zyro/elixir-uuid

## ES6-like Short Maps

https://github.com/whatyouhide/short_maps

Uses a sigil to create ES6-style short maps without mixing short/long styles:

```elixir
foo = 42
bar = 69

~m(foo bar) = %{foo: 42, bar: 69}
```
