defmodule CsvParser do

  def test do
    ~v"""
    Item,Qty,Price
    Teddy Bear,4,34.95
    Milk,1,2.99
    Battery,6,8.00
    """
  end

  def sigil_v(contents, _opts) do
    { header, lines } = csv_to_lists(contents)
    lines |> Enum.map(&Enum.zip(header, &1))
  end

  defp csv_to_lists(contents) do
    [header | rest] = contents |> String.strip |> String.split("\n")
    { parse_header(header), Enum.map(rest, &parse_line/1) }
  end

  defp split_line(line), do: String.split(line, ",")
  defp parse_header(header) do
    header
    |> split_line
    |> Enum.map(&String.to_atom/1)
  end

  defp parse_line(line) do
    line
    |> split_line
    |> Enum.map(fn v ->
      case Float.parse(v) do
        { parsed, _ } -> parsed
        _ -> v
      end
    end)
  end

end


IO.inspect CsvParser.test
