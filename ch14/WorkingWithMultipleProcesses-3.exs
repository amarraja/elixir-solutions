defmodule Processes3 do

  def send_something(pid, error \\ false) do
    send pid, "hi 1!"
    send pid, "hi 2!"
    if error, do: exit(:boom)
    send pid, "hi 3!"
  end

  def run_linked do
    IO.puts "running run_linked"
    spawn_link Processes3, :send_something, [self]
    :timer.sleep(500)
    receive_all
  end

  def run_linked_with_error do
    IO.puts "running run_linked_with_error"
    spawn_link Processes3, :send_something, [self, true]
    :timer.sleep(500)
    receive_all
  end


  def run_monitored do
    IO.puts "running run_monitored"
    spawn_monitor Processes3, :send_something, [self]
    :timer.sleep(500)
    receive_all
  end

  def run_monitored_with_error do
    IO.puts "running run_monitored_with_error"
    spawn_monitor Processes3, :send_something, [self, true]
    :timer.sleep(500)
    receive_all
  end

  def receive_all do
    receive do
      m ->
        IO.puts "Got message: #{inspect m}"
        receive_all
      after 1000 ->
        IO.puts "finished\n\n"
    end
  end

end

Processes3.run_linked
Processes3.run_monitored
Processes3.run_monitored_with_error
Processes3.run_linked_with_error #last since it kills the parent process (this one)
