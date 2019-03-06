defmodule CliTest do
  use ExUnt.Case

  import Mr.CLI, only: [parse_args: 1]

  test "-h ang --help options should return :help" do
    assert parse_args()
  end
end
