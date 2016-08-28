defmodule Chop do
    def guess(actual, range) do
        current = current_guess(range)
        IO.puts "Is it #{current}"
        guess(actual, range, current)
    end

    def guess(actual, lower.._, current_guess) when current_guess > actual do
        lower_half = lower..(current_guess - 1)
        #IO.puts "Too big, searching range"
        #IO.inspect lower_half
        guess(actual, lower_half)
    end

    def guess(actual, _..upper, current_guess) when current_guess < actual do
        upper_half = (current_guess + 1)..upper
        #IO.puts "Too small, searching range"
        #IO.inspect upper_half
        guess(actual, upper_half)
    end

    def guess(actual, _..upper, current_guess) when current_guess == actual do
        IO.puts "Yes, is #{current_guess}"
    end

    def current_guess(bottom..top) do
        bottom + div(top - bottom, 2)
    end
end

IO.puts Chop.guess(273, 1..1000)
