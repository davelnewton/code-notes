# Non-matching function signature; Elixir 1.4
# Elixir 1.5 will add Exception.blame/3 as per:
# https://github.com/elixir-lang/elixir/blob/v1.5/CHANGELOG.md#user-content-exceptionblame
defmodule Tmp do
  def fun(%{some: "map-value"}), do: IO.puts("some map-value")
  def fun(%{another: %{map: "value"}}), do: IO.puts("another map value")

  def go do
    #  fun(%{some: "map-value"})
    #  fun(%{another: %{map: "value"}})
    fun(%{non: "existent"})
  end
end

Tmp.go()

# ** (FunctionClauseError) no function clause matching in Tmp.fun/1
#    nofile:9: Tmp.fun(%{non: "existent"})
#    (stdlib) erl_eval.erl:670: :erl_eval.do_apply/6
#    (elixir) lib/code.ex:170: Code.eval_string/3
