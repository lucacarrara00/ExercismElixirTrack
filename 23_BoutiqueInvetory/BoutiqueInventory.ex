defmodule BoutiqueInventory do
  def sort_by_price(inventory), do: inventory |> Enum.sort_by(& &1.price, :asc)

  def with_missing_price(inventory),
    do:
      inventory
      |> Enum.filter(fn el ->
        !el.price
      end)

  def update_names(inventory, old_word, new_word),
    do:
      inventory
      |> Enum.map(fn el ->
        el
        |> Map.replace(
          :name,
          el.name |> String.replace(old_word, new_word)
        )
      end)

  def increase_quantity(item, count) do
    Map.update!(item, :quantity_by_size, fn quantity ->
      Map.new(quantity, fn {key, value} ->
        {key, value + count}
      end)
    end)
  end

  def total_quantity(item) do
    item.quantity_by_size
    |> Enum.reduce(0, fn {_, value}, acc ->
      acc + value
    end)
  end
end
