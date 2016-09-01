defmodule Linked do

  def boom do
    :timer.sleep(500)
    exit(:boom)
  end

  def run do
    Process.flag(:trap_exit, true)
    spawn_link(Linked, :boom, [])
    receive do
      { :EXIT, _, :normal } ->
        IO.puts "Finished normally..."
      { :EXIT, _, _ } = m ->
        IO.puts "Got :EXIT #{inspect m}"
      m ->
        IO.puts "Got message #{inspect m}"
      after 1000 ->
        IO.puts "Waited to long.. Bye"
    end
  end

end

Linked.run
