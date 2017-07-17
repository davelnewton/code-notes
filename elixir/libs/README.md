# Useful Libraries

| What | Where | More |
| ---- | ----- | ---- |
| Auth + DB | https://github.com/ueberauth/guardian_db | See above |
| Authentication | https://github.com/ueberauth/guardian | Docs https://hexdocs.pm/guardian/api-reference.html |
| Authentication | https://github.com/ueberauth/ueberauth | See above |
| Authorization | https://github.com/boydm/policy_wonk  | |
| Authorization | https://github.com/cpjk/canary | |
| Authorization | https://github.com/schrockwell/bodyguard | https://github.com/schrockwell/bodyguard https://hexdocs.pm/bodyguard/readme.html |
| Code quality | https://github.com/parroty/excoveralls | |
| Code quality | https://github.com/rrrene/credo | http://credo-ci.org/ |
| Code quality | https://github.com/rrrene/inch_ex | |
| CORS | https://github.com/whatyouhide/corsica | |
| Fake data/lorem | https://github.com/igas/faker | |
| GUID | https://github.com/zyro/elixir-uuid | |
| Hashing | https://github.com/riverrun/comeonin | Docs https://hexdocs.pm/comeonin/api-reference.html |
| HTTP | https://github.com/edgurgel/httpoison | |
| I18N/L10N | https://github.com/elixir-lang/gettext | |
| JSON | https://github.com/devinus/poison | |
| Test data | https://github.com/thoughtbot/ex_machina | |
| Time/Date | https://github.com/bitwalker/timex | |

## ES6-like Short Maps

https://github.com/whatyouhide/short_maps

Uses a sigil to create ES6-style short maps without mixing short/long styles:

```elixir
foo = 42
bar = 69

~m(foo bar) = %{foo: 42, bar: 69}
```

## CSRF

* https://stackoverflow.com/questions/40597248/phoenix-invald-csrf-on-ajax-post
