defmodule Calculator do

  def calculate(str) do
    [left, op, right] = str |> to_string |> String.split
    _calculate([chars_to_number(left), op, chars_to_number(right)])
  end

  defp _calculate([left, "+", right]), do: left + right
  defp _calculate([left, "-", right]), do: left - right
  defp _calculate([left, "*", right]), do: left * right
  defp _calculate([left, "/", right]), do: left / right

  defp chars_to_number(str), do: str |> to_string |> String.to_integer

end

IO.puts "Calculator.calculate('123 + 27')"
IO.puts Calculator.calculate('123 + 27')
