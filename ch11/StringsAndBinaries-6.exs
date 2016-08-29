defmodule Capitaliser do

  def capitalise_sentences(str) do
    str
    |> String.split
    |> Enum.map(&String.capitalize/1)
    |> Enum.join " "
  end

end

IO.puts Capitaliser.capitalise_sentences("oh. a. DOG. woof. ")
