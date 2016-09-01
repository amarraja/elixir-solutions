defmodule Issues.TableFormatter do

  def format_table(rows, headers) do
    
    data = for header <- headers do
      for row <- rows, do: to_string(row[header])
    end

    widths = Enum.map data, fn column ->
      column |> Enum.map(&String.length/1) |> Enum.max
    end

    format = (Enum.map_join widths, "  |  ", fn column ->
      "~-#{column}s"
    end) <> "~n"

    :io.format(format, headers)

    seperator = Enum.map_join(widths, "--+--", &(List.duplicate("-", &1)))
    IO.puts seperator

    data
    |> List.zip
    |> Enum.map(&Tuple.to_list/1)
    |> Enum.each(&(:io.format(format, &1)))
  end

end
