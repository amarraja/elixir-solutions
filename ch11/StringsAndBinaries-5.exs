defmodule StringAndBinaries5 do

  def center(strings) do
    column_width = strings
                    |> Enum.map(&String.length/1)
                    |> Enum.max
    _center(strings, column_width)
  end

  defp _center([], _), do: ""
  defp _center([h | t], length) do
    offset = div((length - String.length(h)), 2) + String.length(h)
    IO.puts String.rjust(h, offset)
    _center(t, length)
  end

end

IO.puts StringAndBinaries5.center(["cat", "zebra", "elephant"])
