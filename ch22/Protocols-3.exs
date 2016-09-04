defmodule Reducers do

  def each(list, f) do
    list
    |> Enum.reduce(nil, fn val, _acc -> f.(val) end)
  end

  def filter(list, f) do
    list
    |> Enum.reduce([], fn val, acc ->
      if f.(val), do: [val | acc], else: acc
    end)
    |> Enum.reverse
  end

  def map(list, f) do
    list
    |> Enum.reduce([], fn val, acc -> [f.(val) | acc] end)
    |> Enum.reverse
  end

end

IO.puts "Reducers.each([1, 2, 3], &(IO.puts(\"printing: #\{&1\}\")))"
Reducers.each([1, 2, 3], &(IO.puts("printing: #{&1}")))

IO.puts ""

IO.puts "Reducers.filter(1..10, &(rem(&1, 2) == 0))"
IO.inspect Reducers.filter(1..10, &(rem(&1, 2) == 0))

IO.puts ""

IO.puts "Reducers.map(1..10, &(&1 * 2))"
IO.inspect Reducers.map(1..10, &(&1 * 2))
