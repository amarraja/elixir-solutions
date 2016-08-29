defmodule StringsAndBinaries do


  def is_printable(str) do
    space = ?\s
    tilde = ?~
    Enum.all? str, &(&1 >= space && &1 <= tilde)
  end

  def anagram?(a, b), do: Enum.sort(a) == Enum.sort(b)

end

IO.puts "StringsAndBinaries.is_printable('hello!')"
IO.puts StringsAndBinaries.is_printable('hello!')

IO.puts "StringsAndBinaries.is_printable('hello!')"
IO.puts StringsAndBinaries.is_printable('hello!')

IO.puts "StringsAndBinaries.anagram?('cat', 'act')"
IO.puts StringsAndBinaries.anagram?('red', 'der')

IO.puts "StringsAndBinaries.anagram?('cat', 'dog')"
IO.puts StringsAndBinaries.anagram?('cat', 'dog')
