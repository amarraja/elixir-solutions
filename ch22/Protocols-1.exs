defprotocol Cesar do
  def encrypt(string, shift)
  def rot13(string)
end

defimpl Cesar, for: BitString do
  def encrypt(string, shift) do
    string |> to_char_list |> Cesar.encrypt(shift) |> to_string
  end
  def rot13(string), do: encrypt(string, 13)
end

defimpl Cesar, for: List do
  def encrypt(string, shift) do
    cesar(string, shift)
  end
  def rot13(string), do: encrypt(string, 13)

  defp cesar([], _), do: []
  defp cesar([head | tail], shift) do
    [_translate_char(head + shift) | cesar(tail, shift)]
  end
  defp _translate_char(chr) when chr > ?z do
    ?a + (chr - ?z - 1)
  end
  defp _translate_char(chr) do
    chr
  end
end

IO.inspect Cesar.encrypt('elixir', 14)
IO.inspect Cesar.rot13('elixir')

IO.inspect Cesar.encrypt("elixir", 14)
IO.inspect Cesar.rot13("elixir")
