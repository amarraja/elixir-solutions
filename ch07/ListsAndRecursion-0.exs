
defmodule MyList do
  def sum([]), do: 0
  def sum([head | tail]), do: head + sum(tail)

  def map([], _), do: []
  def map([head | tail], f), do: [f.(head) | map(tail, f)]

  def mapsum(list, func), do: map(list, func) |> sum

  def reduce([], acc, _), do: acc
  def reduce([head | tail], acc, f), do: reduce(tail, f.(head, acc), f)

  def max(list) do
    find_max = fn(a, b) ->
      if a > b do a else b end
    end
    list |> reduce(0, find_max)
  end

  def max_no_reduce([x]), do: x
  def max_no_reduce([h | t]), do: Kernel.max(h, max(t))

  def cesar(text, shift) do
    z = ?z
    a = ?a

    IO.puts "z: #{z}, a: #{a}"

    translator = fn chr ->
      newchr = chr + shift
      if newchr > z do
        newchr = a + (newchr - z - 1)
      end
      IO.puts "chr: #{chr}, newchr: #{newchr}"
      newchr
    end

    map(text, translator)
  end

end

IO.puts "sum"
IO.puts MyList.sum([1, 2, 3])

IO.puts "map sum"
IO.puts MyList.mapsum([1, 2, 3], &(&1 * &1))

IO.puts "max"
IO.puts MyList.max([1, 3, 2])

IO.puts "max no recduce"
IO.puts MyList.max_no_reduce([1, 3, 2])

IO.puts "cesar"
IO.puts MyList.cesar('ryvkve', 13)
