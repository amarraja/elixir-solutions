defmodule Sequence.StackServer do
  use GenServer

  def start_link(state) do
    GenServer.start_link(__MODULE__, state, name: __MODULE__)
  end

  def pop do
    GenServer.call(__MODULE__, :pop)
  end

  def push(item) do
    GenServer.cast(__MODULE__, { :push, item })
  end

  def handle_call(:pop, _from, [h | t]) do
    { :reply, h, t }
  end

  def handle_cast({ :push, item }, stack) do
    { :noreply, [item] ++ stack }
  end

end
