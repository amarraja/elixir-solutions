defmodule Sigils do

  def sigil_v(value, _) do
    value
    |> String.split
    |> Enum.map(&String.split(&1, ","))
    |> Enum.map(&parse_list/1)
  end

  def parse_list(list) do
    list
    |> Enum.map(fn v ->
      case Float.parse(v) do
        { num, _ } -> num
        :error -> v
      end
    end)
  end

  def test do
    ~v"""
    1,2,3
    cat,dog
    """
  end

end

IO.inspect(Sigils.test)
