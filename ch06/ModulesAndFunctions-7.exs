
IO.puts :io.format("~.1f~n", [1.234])

IO.puts System.get_env("TMPDIR")

IO.puts Path.extname("some/file.ex")

IO.puts System.cwd

# Poison.Parser.parse!

{res, _} = System.cmd("echo", ["echo from elxir"])
IO.puts res
