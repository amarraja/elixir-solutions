defmodule FibServer do

  def calculate(scheduler) do
    send scheduler, { :ready, self }
    receive do
      { :fib, n, sender } ->
        send sender, { :answer, n, fib(n) }
        calculate(scheduler)
      { :shutdown } ->
        exit(:normal)
    end
  end

  def fib(0), do: 0
  def fib(1), do: 1
  def fib(n), do: fib(n - 1) + fib(n - 2)

end

defmodule FibScheduler do
  def run(workers) do

    1..workers
    |> Enum.map(fn _ -> spawn_link FibServer, :calculate, [self] end)
    |> process_all([37, 37, 37, 37, 37, 37], [])

  end

  def process_all(processors, queue, acc) do
    receive do

      { :ready, pid } when length(queue) > 0 ->
        [h | tail] = queue
        send pid, { :fib, h, self }
        process_all(processors, tail, acc)

      { :ready, pid } ->
        send pid, :shutdown
        if length(processors) > 1 do
          process_all(List.delete(processors, pid), queue, acc)
        else
          acc
        end

      { :answer, n, result } ->
        # IO.puts("fib(#{n})=#{result}")
        process_all(processors, queue, [ { n, result } | acc ])

    end
  end

end

Enum.each 1..10, fn workers ->
    {time, _} = :timer.tc(FibScheduler, :run, [workers])
    IO.puts "#{workers}: #{time/1_000_000.0}"
end
