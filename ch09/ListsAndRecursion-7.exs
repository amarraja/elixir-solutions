defmodule MyList do
  #def span(from, to) when from > to, do: [to]
  def span(_from = to, to), do: [to]
  def span(from, to), do: [from | span(from + 1, to)]


  def span_prime(n) do
    for x <- span(2, n), is_prime?(x), do: x
  end

  def is_prime?(2), do: true
  def is_prime?(n) do
    #not divisible by any number from 2 to n - 1
    !Enum.any?(span(2, n - 1), &(rem(n, &1) == 0))
  end

end

IO.inspect MyList.span_prime(40)
