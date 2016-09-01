defmodule Monitored do

  def boom do
    :timer.sleep(500)
    # exit(:boom)
  end

  def run do
    spawn_monitor(Monitored, :boom, [])
    receive do
      m ->
        IO.puts "got message: #{inspect m}"
      after 1000 ->
        IO.puts "waited too long... bye"
    end
  end

end

Monitored.run
