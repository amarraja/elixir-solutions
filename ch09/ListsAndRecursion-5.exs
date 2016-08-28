defmodule MyEnum do

  def all?([], _), do: true
  def all?([head | tail], f), do: f.(head) && all?(tail, f)

  def each([], _), do: :ok
  def each([head | tail], f) do
    f.(head)
    each(tail, f)
  end

  def filter([], _), do: []
  def filter([head | tail], f) do
    if f.(head) do
      [head | filter(tail, f)]
    else
      filter(tail, f)
    end
  end


  def reverse(list), do: do_reverse(list, [])
  def do_reverse([], acc), do: acc
  def do_reverse([h | tail], acc), do: do_reverse(tail, [h | acc])

  def split(list, count) do
      do_split(list, count, {[], []})
  end

  def do_split([h|t], count, { first, second }) when count > 0 do
    do_split(t, count - 1, { [h | first], second })
  end

  def do_split([h|t], count, { first, second }) when count <= 0 do
    do_split(t, count - 1, { first, [h | second] })
  end

  def do_split([], _, { first, second }) do
    { reverse(first), reverse(second) }
  end

  def take(list, count) do
    {h, _} = split(list, count)
    h
  end

  #def take(list, count), do: do_take(list, count, [])
  #def do_take([h|t], count, acc) when count > 0 do
  #  do_take(t, count - 1, [h | acc])
  #end
  #def do_take(_, _, acc) do
  #  reverse(acc)
  #end


end
require Integer
IO.puts "MyEnum.all? [1, 2, 3], &(&1 < 4)"
IO.puts MyEnum.all? [1, 2, 3], &(&1 < 4)

IO.puts "MyEnum.all? [1, 2, 3], &(&1 < 3)"
IO.puts MyEnum.all? [1, 2, 3], &(&1 < 3)

IO.puts "MyEnum.each 1..3, &(IO.puts &1)"
IO.puts MyEnum.each [1, 2, 3], &(IO.puts "each: #{&1}")

IO.puts "MyEnum.filter(Enum.to_list(1..20), &Integer.is_even/1)"
IO.inspect MyEnum.filter(Enum.to_list(1..20), &Integer.is_even/1)

IO.puts "MyEnum.split [1, 2, 3, 4, 5], 3"
IO.inspect MyEnum.split([1, 2, 3, 4, 5], 3)

IO.puts "MyEnum.take [1, 2, 3, 4, 5], 3"
IO.inspect MyEnum.take([1, 2, 3, 4, 5], 3)
