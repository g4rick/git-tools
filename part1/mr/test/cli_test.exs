defmodule CliTest do
  use ExUnit.Case

  import Mr.CLI, only: [parse_args: 1]

  test "return :help if -h or --help is first of muti options" do
    assert parse_args(["-h", "show", "--host", "value"]) == :help
    assert parse_args(["--help", "show", "--host", "value"]) == :help
    assert parse_args(["--help", "show", "--host"]) == :help
    assert parse_args(["--help", "-show", "-h", "value"]) == :help
  end

  test "return :help if first options not show" do
    assert parse_args(["--host", "value", "show", "-h", "u"]) == :help
  end

  test "not return :help if first option is show" do
    assert parse_args(["show", "-h", "--host", "value"]) != :help
  end
end
