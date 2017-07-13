# defp fetch_multiple(urls, conn) do
#   req_headers = Enum.into(conn.req_headers, %{})
#
#   headers = %{
#     "Accept"        => "application/json",
#     "Content-Type"  => "application/json",
#     "Authorization" => "#{req_headers["authorization"]}",
#     "teladoc-api-request-token" => req_headers["teladoc-api-request-token"]
#   } |> TasLogTags.inject(conn.resp_headers)
#
#   recv_timeout = Application.get_env(:screenflow, :recv_timeout)
#
#   Enum.map(urls, fn {key, url} ->
#     Task.async(fn ->
#       %{key: key, response: @http_client.get!(url, headers, recv_timeout: recv_timeout)}
#     end)
#   end)
#   |> Enum.map(&(Task.await(&1, recv_timeout)))
# end
#
# defp fetch_multiple_external(urls, conn) do
#   req_headers = Enum.into(conn.req_headers, %{})
#
#   headers = %{
#     "Accept"        => "text/html",
#     "Content-Type"  => "text/html",
#   }
#
#   recv_timeout = Application.get_env(:screenflow, :recv_timeout)
#
#   Enum.map(urls, fn {url, key} ->
#     Task.async(fn ->
#       %{key: key, response: @http_client.get!(url, headers, recv_timeout: recv_timeout)}
#     end)
#   end)
#   |> Enum.map(&(Task.await(&1, recv_timeout)))
# end

defmodule Fetcher do
  @http_client %{:"get!" => &__MODULE__.dummy/3}

  def dummy(_url, _headers, _map), do: true

  def fetch_multiple(urls, conn, fetch_type \\ :internal)

  def fetch_multiple(urls, conn, :internal) do
    req_headers  = Enum.into(conn.req_headers, %{})

    headers = %{
      "Accept"        => "application/json",
      "Content-Type"  => "application/json",
      "Authorization" => "#{req_headers["authorization"]}",
      "teladoc-api-request-token" => req_headers["teladoc-api-request-token"]
    } |> TasLogTags.inject(conn.resp_headers)

    fetch_all_async(headers, urls)
  end

  def fetch_multiple(urls, _conn, :external) do
    headers = %{
      "Accept"        => "text/html",
      "Content-Type"  => "text/html",
    }

    fetch_all_async(headers, urls)
  end

  defp fetch_all_async(headers, urls) do
    recv_timeout = Application.get_env(:screenflow, :recv_timeout)

    Enum.map(urls, fn({key, url}) ->
      Task.async(fn ->
        %{key: key, response: @http_client.get!(url, headers, recv_timeout: recv_timeout)}
      end)
    end)
    |> Enum.map(&(Task.await(&1, recv_timeout)))
  end


end
