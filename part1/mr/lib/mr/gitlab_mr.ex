defmodule Mr.GitlabMr do
  def fetch(host, repo) do
    IO.inspect(mr_url(host, repo))
  end

  defp mr_url(host, repo) do
    "https://#{host}/api/v4/projects/#{URI.encode_www_form(repo)}/merge_requests"
  end
end
