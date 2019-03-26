defmodule Mr.CLI do
  @moduledoc """
  接收命令行参数
  """
  def run(argv) do
    parse_args(argv)
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
        switches: [help: :boolean],
        aliases: [h: :help]
      )

    case parse do
      {[:help, true], _, _} ->
        :help

      {[], ["show" | tail], _} ->
        IO.inspect(tail)

      _ ->
        :help
    end
  end
end
