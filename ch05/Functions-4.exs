prefix = fn pf ->
    fn val -> "#{pf} #{val}" end
end

mrs = prefix.("Mrs")
IO.puts mrs.("Smith")
IO.puts prefix.("Elixir").("Rocks")
