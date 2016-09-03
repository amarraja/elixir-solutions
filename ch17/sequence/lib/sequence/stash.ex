defmodule Sequence.Stash do
  use GenServer

  def start_link(current_stack) do
    { :ok, pid } = GenServer.start_link(__MODULE__, current_stack)
  end

  def save_value(pid, stack) do
    GenServer.cast(pid, {:save_value, stack})
  end

  def get_value(pid) do
    GenServer.call(pid, :get_value)
  end

  def handle_call(:get_value, _from, current_stack) do
    { :reply, current_stack, current_stack }
  end

  def handle_cast({ :save_value, new_stack }, _) do
    { :noreply, new_stack }
  end

end
