## Libraries/Etc.

https://elixirnation.io/

## Articles/Etc.

http://www.akitaonrails.com/2015/11/22/observing-processes-in-elixir-the-little-elixir-otp-guidebook

## Introspection

## Observer

```elixir
> :observer.start
```

### List Functions

https://hexdocs.pm/elixir/Module.html#__info__/1

```elixir
> SomeModule.__info__(:functions)
[some_function: n, other_function: n] # Where `n` is function arity
```

### Module Metadata

```elixir
> Todo1.__info__(:attributes)
[vsn: [93241567868840991907522900278845287925], behaviour: [GenServer]]
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
