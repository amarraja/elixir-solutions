defmodule Issues.CLI do
  def run(argv) do
    argv
    |> parse_args
    |> process
  end

  def process(:help), do: IO.puts "put help here!"
  def process({user, project, count}) do
    Issues.GithubIssues.fetch(user, project)
    |> decode_response
    |> convert_to_maps
    |> sort_ascending
    |> Enum.take(count)
  end

  def decode_response({:ok, body}), do: body
  def decode_response({:error, err}) do
    {_, msg} = List.keyfind(err, "message", 0)
    IO.puts "Error fetching form github: #{msg}"
    System.halt(1)
  end

  def convert_to_maps(list) do
    list |> Enum.map(&Enum.into(&1, Map.new))
  end

  def sort_ascending(list) do
    Enum.sort list, fn i1, i2 ->
      i1["created_at"] <= i2["created_at"]
    end
  end

  def parse_args(argv) do
    parse = OptionParser.parse(argv, switches: [help: :boolean], aliases: [h: :help])

    case parse do
      { [help: true], _, _ } -> :help
      { _, [user, project, count], _ } -> { user, project, String.to_integer(count) }
      { _, [user, project ], _ } -> { user, project, 4 }
      _ -> :help
    end
  end
end
