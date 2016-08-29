defmodule Taxman do

  def apply_tax(orders, rates) do
    for order <- orders do
      rate = Keyword.get(rates, order[:ship_to], 0)
      net = order[:net_amount]
      total = net + (net * rate)
      order ++ [total_amount: total]
    end
  end

  def apply_tax_2(order, rates) do
    order |> Enum.map &(order_with_tax(&1, rates))
  end

  defp order_with_tax(order, rates) do
    rate = Keyword.get(rates, order[:ship_to], 0)
    net = order[:net_amount]
    total = net + (net * rate)
    order ++ [total_amount: total]
  end

end

tax_rates = [ NC: 0.075, TX: 0.08 ]
orders = [
    [ id: 123, ship_to: :NC, net_amount: 100.00 ],
    [ id: 124, ship_to: :OK, net_amount:  35.50 ],
    [ id: 125, ship_to: :TX, net_amount:  24.00 ],
    [ id: 126, ship_to: :TX, net_amount:  44.80 ],
    [ id: 127, ship_to: :NC, net_amount:  25.00 ],
    [ id: 128, ship_to: :MA, net_amount:  10.00 ],
    [ id: 129, ship_to: :CA, net_amount: 102.00 ],
    [ id: 120, ship_to: :NC, net_amount:  50.00 ] ]

IO.inspect Taxman.apply_tax orders, tax_rates
IO.inspect Taxman.apply_tax_2 orders, tax_rates
