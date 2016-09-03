defmodule Sequence.Supervisor do
  use Supervisor

  def start_link(initial_stack) do
    { ok, pid } = Supervisor.start_link(__MODULE__, initial_stack)
    boot_workers(pid, initial_stack)
    { :ok, pid }
  end

  def boot_workers(sup, initial_stack) do
    { :ok, stash_pid } = Supervisor.start_child(sup, worker(Sequence.Stash, [initial_stack]))
    Supervisor.start_child(sup, supervisor(Sequence.StackSupervisor, [stash_pid]))
  end

  def init(_) do
    supervise [], strategy: :one_for_one
  end

end
