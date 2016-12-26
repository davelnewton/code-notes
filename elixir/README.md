# Elixir Notes and Snippets

## Ternary

Two options; using logic operators:

```elixir
condition && (truthy value) || (falsey value)
```

Using `if` macro:

```elixir
if condition, do: (truthy value), else: (falsey value)
```

## Requiring files

```elixir
defmodule TodoList do
  # require MultiDict
  Code.require_file "multi_dict.ex", __DIR__
```
