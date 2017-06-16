# Misc HTTPoison Notes

## Pattern Matching Responses

https://stackoverflow.com/questions/40217199/pattern-match-httpoison-response-elixir

```elixir
case HTTPoison.get(url, [], []) do
  {:ok, response} ->
    upload(response.status_code, response.body, starting, camera_exid)
    do_loop(starting + interval, ending, interval, camera_exid)
  {:error, %HTTPoison.Error{reason: reason}} ->
    IO.inspect "Media: #{reason}!"
    :timer.sleep(:timer.seconds(3))
    do_loop(starting, ending, interval, camera_exid)
end
```

Example:

```elixir
def get_some_thing(pid) do
  get("http://some.url.com")
  |> handle_response(pid)
end

def handle_response({:ok, response}, pid) do
  decode_response(response.body)
  |> send_ok(pid)
end

def handle_response({:error, %HTTPoison.Error{reason: reason}}, pid) do
  "HTTPoison error: #{reason}"
  |> send_error(pid)
end

def handle_response({:error, reason}, pid) do
  "Some other error: #{reason}"
  |> send_error(pid)
end
```
