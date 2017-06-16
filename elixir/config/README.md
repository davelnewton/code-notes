# Mix Configuration

* https://hexdocs.pm/mix/Mix.Config.html
* http://www.schmitty.me/taking-advantage-of-mix-config/

---

In your Mix project:

* Un-comment `import_config "#{Mix.env}.exs"` in `config/config.exs`
* Create `config/test.exs` `config/dev.exs` and `config/prod.exs`

You can create simple cfg values and structures:

```elixir
# config/test.exs
use Mix.Config

config :hc,
  bacon_responder:   Hc.Response.LocalBaconResponse,
  hipchat_responder: Hc.Hipchat

config :hc, Hipchat,
  history_token: "test-env-history-token",
  message_token: "test-env-message-token"
```

Then to access:

```elixir
Application.get_env(:hc, :bacon_responder)
Application.get_env(:hc, Hipchat)[:history_token]
```

You can use these as module attributes in modules and it acts sort of like an injected value:

```elixir
defmodule Some.Module  do
  @hipchat_responder Application.get_env(:hc, :hipchat_responder)

  def reply_to_mention({_id, msg, from}, room_name) do
    @hipchat_responder.post_message(room_name, from, get_reply_to(msg))
  end
end
```
