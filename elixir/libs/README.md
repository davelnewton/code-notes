# Useful Libraries

| What | Where | More |
| ---- | ----- | ---- |
| GUID | https://github.com/zyro/elixir-uuid | |
| HTTP | https://github.com/edgurgel/httpoison | |
| JSON | https://github.com/devinus/poison | |
| Authentication | https://github.com/ueberauth/guardian
| Test data | https://github.com/thoughtbot/ex_machina | |
| Code quality | https://github.com/rrrene/credo | |
| Fake data/lorem | https://github.com/igas/faker | |
| I18N/L10N | https://github.com/elixir-lang/gettext | |
| Authorization | https://github.com/schrockwell/bodyguard | |
| Time/Date | https://github.com/bitwalker/timex | |
| CORS | 

## ES6-like Short Maps

https://github.com/whatyouhide/short_maps

Uses a sigil to create ES6-style short maps without mixing short/long styles:

```elixir
foo = 42
bar = 69

~m(foo bar) = %{foo: 42, bar: 69}
```
