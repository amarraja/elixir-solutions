defmodule Flattener do

  def flatten([]), do: []
  def flatten([h | t]) do
    if is_list(h) do
      flatten(h) ++ flatten(t)
    else
      [h | flatten(t)]
    end
  end

end

IO.puts "flatten([ 1, [ 2, 3, [4] ], 5, [[[6]]]])"
IO.inspect Flattener.flatten([ 1, [ 2, 3, [4] ], 5, [[[6]]]])
