# Ecto Notes

## Migrations

* https://hexdocs.pm/ecto/Mix.Tasks.Ecto.Gen.Migration.html

### Add `has_many` rel in migration

* http://stackoverflow.com/q/29053387/438992
* https://github.com/davelnewton/todos/blob/spike/adding-users-and-auth/priv/repo/migrations/20170105224309_add_users_todo_relations.exs

### Many-to-Many

* http://learningwithjb.com/posts/many-to-many-relationship

## Indexing with PG

* http://rny.io/elixir/ecto/postgresql/2015/08/31/postgresql-indexing-with-ecto.html

## Human-readable Changeset Errors

Adapted from http://www.thisisnotajoke.com/blog/2015/09/serializing-ecto-changeset-errors-to-jsonapi-in-elixir.html.

This is a WIP and will be updated.

```elixir
defmodule App.ChangesetView do
  use App.Web, :view

  def render("error.json", %{changeset: changeset}) do
    %{errors: Enum.map(changeset.errors, &get_details/1)}
  end

  defp get_details({field, detail}) do
    human_field = field |> to_string |> String.capitalize

    %{
      source:  field,
      message: "#{human_field} #{render_detail(detail)}"
    }
  end

  defp render_detail({msg, vals}), do: Enum.reduce(vals, msg, &tmp_fn/2)
  defp render_detail(msg), do: msg

  defp tmp_fn({k, v}, acc) do
    String.replace(acc, "%{#{k}}", to_string(v))
  end

end
```
