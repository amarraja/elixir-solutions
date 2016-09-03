defmodule Sequence.StackServer do
  use GenServer

  def start_link(stash_pid) do
    GenServer.start_link(__MODULE__, stash_pid, name: __MODULE__)
  end

  def init(stash_pid) do
    current_stack = Sequence.Stash.get_value(stash_pid)
    { :ok, { current_stack, stash_pid } }
  end

  def terminate(_reason, {stack, stash_pid}) do
    Sequence.Stash.save_value(stash_pid, stack)
  end

  def pop do
    GenServer.call(__MODULE__, :pop)
  end

  def push(item) do
    if item == 11, do: raise "boom"
    GenServer.cast(__MODULE__, { :push, item })
  end

  def handle_call(:pop, _from, {[h | t], stash}) do
    { :reply, h, { t, stash } }
  end

  def handle_cast({ :push, item }, { stack, stash }) do
    { :noreply, { [item] ++ stack, stash } }
  end

end
