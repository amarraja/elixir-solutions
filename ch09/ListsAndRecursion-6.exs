defmodule Flattener do

  def flatten(list) do
    do_flatten(list)
  end

  def do_flatten([h | t]) do
    if is_list(h) do
      do_flatten(h) ++ do_flatten(t)
    else
      [h | do_flatten(t)]
    end
  end

  def do_flatten([]) do
    []
  end

end

IO.puts "flatten([ 1, [ 2, 3, [4] ], 5, [[[6]]]])"
IO.inspect Flattener.flatten([ 1, [ 2, 3, [4] ], 5, [[[6]]]])
