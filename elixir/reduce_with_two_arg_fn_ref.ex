defmodule Tmp do
  def do_this do
    Enum.reduce([1, 2, 3], 10, &some_fun/2)
    |> IO.inspect()
  end

  def some_fun(n, acc), do: acc + n
end

Tmp.do_this()
