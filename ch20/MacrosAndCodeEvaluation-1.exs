defmodule Macros do
  defmacro dotrace(code) do
    code_string = Macro.to_string(code)
    quote do
      IO.puts "Running: #{unquote(code_string)}"
      val = unquote(code)
      IO.puts "#=> #{val}"
    end
  end

  defmacro myunless(condition, keywords) do
    do_clause = Keyword.get(keywords, :do, nil)
    else_clause = Keyword.get(keywords, :else, nil)
    quote do
      case unquote(condition) do
        x when x in [false, nil] ->
          unquote(do_clause)
        _ ->
          unquote(else_clause)
      end
    end
  end

  defmacro times(n) do
    method = :"times_#{n}"
    quote do
      def unquote(method)(x) do
        x * unquote(n)
      end
    end
  end
end

defmodule MacrosTest do
  require Macros

  def run_unless do
    #dotrace 1 == 1, do: "a"
    Macros.dotrace Macros.myunless true, do: "don't run", else: "run"
    Macros.dotrace Macros.myunless false, do: "run", else: "don't run"
  end

  Macros.times(3)
  Macros.times(4)
  def run_times do
    Macros.dotrace times_3(4)
    Macros.dotrace times_4(5)
  end

end

MacrosTest.run_unless
MacrosTest.run_times
