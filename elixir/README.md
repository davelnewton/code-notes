<!-- TOC depthFrom:1 depthTo:6 withLinks:1 updateOnSave:1 orderedList:0 -->

- [Elixir](#elixir)
	- [Articles/Etc.](#articlesetc)
	- [Introspection](#introspection)
	- [Observer](#observer)
		- [List Functions](#list-functions)
		- [Module Metadata](#module-metadata)
	- [Ternary](#ternary)
	- [Requiring files](#requiring-files)
	- [Connect to Running Elixir App](#connect-to-running-elixir-app)
	- [Default Args](#default-args)

<!-- /TOC -->

# Elixir

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

## Connect to Running Elixir App

* http://joeellis.la/iex-remsh-shells/
* https://broot.ca/erlang-remsh-is-dangerous
* http://sgeos.github.io/elixir/erlang/observer/2016/09/16/elixir_erlang_running_otp_observer_remotely.html

## Default Args

```elixir
def some_function(param \\ "default-value"), do: IO.puts(param)
```
