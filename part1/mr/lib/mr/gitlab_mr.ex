defmodule Mr.GitlabMr do
  def fetch(host, repo, token) do
    mr_url(host, repo)
    |> HTTPoison.get!([{"PRIVATE-TOKEN", token}])
    |> handle_response()
  end

  defp mr_url(host, repo) do
    "https://#{host}/api/v4/projects/#{URI.encode_www_form(repo)}/merge_requests"
  end

  defp handle_response(%{status_code: 200, body: body}) do
    IO.inspect(body)
    {:ok, body}
  end

  defp handle_response(%{status_code: ___, body: body}) do
    IO.inspect(body)
    {:error, body}
  end
end
