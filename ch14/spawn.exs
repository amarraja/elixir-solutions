defmodule Spawnee do

  def greet do
    receive do
      { sender, message } ->
        send sender, { :ok, "Hello, #{message}" }
        greet
    end
  end


  def greet_with_state(times \\ 1) do
    receive do
      { sender, message } ->
        send sender, { :ok, "Hello, #{times} times" }
        greet_with_state(times + 1)
    end
  end

end

child = spawn(Spawnee, :greet, [])
send child, { self, "from the spawn of me" }
receive do
  { :ok, message } ->
    IO.puts message
end

send child, { self, "from another send" }
receive do
  { :ok, message } ->
    IO.puts message
  after 1000 ->
    IO.puts "Giving up agter 1000 ms"
end


child_state = spawn(Spawnee, :greet_with_state, [])
send child_state, { self, "ignored" }
receive do
  { :ok, message } ->
    IO.puts message
end

send child_state, { self, "ignored" }
receive do
  { :ok, message } ->
    IO.puts message
end

send child_state, { self, "ignored" }
receive do
  { :ok, message } ->
    IO.puts message
end
