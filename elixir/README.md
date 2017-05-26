## Module Introspection

https://hexdocs.pm/elixir/Module.html#__info__/1

```elixir
> SomeModule.__info__(:functions)
[some_function: n, other_function: n] # Where `n` is function arity
```

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
