# Pattern Matching

## Nested maps

m = %{
  "id": "some_id",
  "message": "some message here",
  "cruft": "plugh",
  "from": %{
    "mention_name": "dnewton",
    "something_else": "ohai"
  }
}

%{
  id: id,
  message: message,
  from: %{
    mention_name: mention_name
  }
} = m

IO.puts id
IO.puts message
IO.puts mention_name
