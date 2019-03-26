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

  test "return :help if first option is show but invalid host or repo" do
    assert parse_args(["show", "-h", "--host", "value"]) == :help
    assert parse_args(["show", "--host", "--repo", "repo_name"]) == :help
  end

  test "return right tuple if first option is show and follow value are valid host and repo" do
    host_name = "helijia.com"
    repo_name = "mobile-v3"

    assert parse_args(["show", "--host", host_name, "--repo", repo_name]) ==
             {:show, host_name, repo_name}

    assert parse_args(["show", "--repo", repo_name, "--host", host_name]) ==
             {:show, host_name, repo_name}
  end
end
