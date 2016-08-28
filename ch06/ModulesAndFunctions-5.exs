defmodule Maf5 do
    def sum(1), do: 1
    def sum(n), do: n + sum(n - 1)

    def gcd(x, 0), do: x
    def gcd(x, y), do: gcd(y, rem(x, y))
end

IO.puts Maf5.sum(5)
IO.puts Maf5.gcd(8, 12)
