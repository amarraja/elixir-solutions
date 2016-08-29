defmodule Fizz do

  def up_to(n) do
    1..n |> Enum.map(&fizzbuzz/1)
  end

  def fizzbuzz(number) do
    case { rem(number, 3), rem(number, 5) } do
      { 0, 0 } -> "FizzBuzz"
      { 0, _ } -> "Fizz"
      { _, 0 } -> "Buzz"
      _ -> number
    end
  end

end

IO.inspect Fizz.up_to(20)
