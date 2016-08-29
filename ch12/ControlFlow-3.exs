defmodule Checker do

  def ok!({:ok, value}), do: value
  def ok!({:error, err}), do: raise to_string(err)

end

IO.inspect Checker.ok!(File.open("README.md"))
IO.inspect Checker.ok!(File.open("nothere"))
