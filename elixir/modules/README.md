## Module Attributes

https://elixir-lang.org/getting-started/module-attributes.html


```elixir
defmodule TestModuleVals do
  @some_map %{
    foo: "bar",
    baz: "plugh"
  }

  def use_module_map do
    IO.inspect @some_map
    IO.puts @some_map[:foo]
  end
end

TestModuleVals.use_module_map()
```

If you want the attribute available directly at runtime you can use `Module.register_attribute/3`:

```elixir
defmodule TestModuleVals do
  Module.register_attribute(__MODULE__,
    :some_map,
    persist: true)

  @some_map %{
    foo: "bar",
    baz: "plugh"
  }
end

TestModuleVals.__info__(:attributes)[:some_map]
```

This seems awful.
