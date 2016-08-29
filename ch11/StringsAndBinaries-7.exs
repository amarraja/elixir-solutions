defmodule Loader do

  def read(file) do
    File.open!(file)
    |> IO.stream(:line)
    |> Enum.drop(1)
    |> Enum.map(&extract_row/1)
  end

  defp extract_row(row) do
    [id, ship_to, net_amount] = row |> String.strip |> String.split(",")
    
    [ id: String.to_integer(id),
      ship_to: ship_to |> String.lstrip(?:) |> String.to_atom,
      net_amount: String.to_float(net_amount) ]
  end

end

IO.inspect Loader.read("/users/amar/code/programming-elixir/ch11/data.csv")
