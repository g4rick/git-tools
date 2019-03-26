defmodule CliTest do
  use ExUnit.Case

  import Mr.CLI, only: [parse_args: 1]

  test "-h ang --help options should return :help" do
    assert parse_args(["--help", "anything"]) == :help
    assert parse_args(["-h", "anything"]) == :help
  end

  test "-h is first of muti switches should return :help" do
    assert parse_args(["-h", "show", "--name", "value"]) == :help
    assert parse_args(["--help", "show", "--name", "value"]) == :help
    assert parse_args(["--help", "show", "--name"]) == :help
    assert parse_args(["--help", "-show", "-h", "value"]) == :help
  end

  test "-h is not first options should not return :help" do
    assert parse_args(["show", "-h", "--name", "value"]) != :help
  end
end
