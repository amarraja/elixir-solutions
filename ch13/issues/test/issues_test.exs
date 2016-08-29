defmodule IssuesTest do
  use ExUnit.Case
  doctest Issues

  import Issues.CLI, only: [parse_args: 1]

  test ":help for help" do
    assert parse_args(["-h", "blah"]) == :help
    assert parse_args(["--help", "blah"]) == :help
    assert parse_args(["asdad"]) == :help
  end

  test "three values" do
    assert parse_args(["elixir-lang", "elixir", "99"]) ==
        { "elixir-lang", "elixir", 99 }
  end

  test "two values" do
    assert parse_args(["elixir-lang", "elixir"]) ==
        { "elixir-lang", "elixir", 4 }
  end

end
