fb = fn
    0, 0, _ -> "FizzBuzz"
    0, _, _ -> "Fizz"
    _, 0, _ -> "Buzz"
    _, _, n -> "#{n}"
end

dofb = fn n ->
    fb.(rem(n, 3), rem(n, 5), n)
end

IO.puts dofb.(10)
IO.puts dofb.(11)
IO.puts dofb.(12)
IO.puts dofb.(13)
IO.puts dofb.(14)
IO.puts dofb.(15)
IO.puts dofb.(16)
