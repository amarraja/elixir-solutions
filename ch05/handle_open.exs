handle_open = fn
    { :ok, file } -> "First line: #{IO.read(file, :line)}"
    { _, err } -> "Error: #{:file.format_error(err)}"
end

IO.puts handle_open.(File.open("05-handle_open.exs"))
IO.puts handle_open.(File.open("05-nothere.exs"))
