defmodule Mr.CLI do
  @moduledoc """
  接收命令行参数
  """
  def run(argv) do
    argv
    |> parse_args
    |> process
  end

  @doc """
  使用自带的 OptionParser 库处理参数
  https://hexdocs.pm/elixir/OptionParser.html
  可能的参数 -h --help 返回 :help
  其他情况参数是 { } 
  """
  def parse_args(argv) do
    parse =
      OptionParser.parse_head(argv,
        switches: [help: :boolean, host: :string, repo: :string],
        aliases: [h: :help]
      )

    case parse do
      {[:help, true], _, _} ->
        :help

      {[], ["show", "--host", host, "--repo", repo, "--token", token], _} ->
        {:show, host, repo, token}

      {[], ["show", "--repo", repo, "--host", host, "--token", token], _} ->
        {:show, host, repo, token}

      {[], ["show", "--repo", repo, "--token", token, "--host", host], _} ->
        {:show, host, repo, token}

      {[], ["show", "--host", host, "--token", token, "--repo", repo], _} ->
        {:show, host, repo, token}

      {[], ["show", "--token", token, "--host", host, "--repo", repo], _} ->
        {:show, host, repo, token}

      {[], ["show", "--token", token, "--repo", repo, "--host", host], _} ->
        {:show, host, repo, token}

      _ ->
        :help
    end
  end

  def process(:help) do
    IO.puts("""
    usage: mr show --host <HOST> --repo <REPO> --token <TOKEN>

    explain:
    host     the host merge request in.
    repo     the repo merge request in.
    token    the repo person_token is needed.

    example: 
    mr show --host git.hlj.team --repo web/mobile-v3 --token abcd
    """)

    System.halt(0)
  end

  def process({:show, host, repo, token}) do
    Mr.GitlabMr.fetch(host, repo, token)
  end
end
