defmodule BirdCount do
    def today([]), do: nil
    def today([h | _] = _list), do: h
    def increment_day_count([]), do: [1]
    def increment_day_count([h | t] = _list), do: [h + 1 | t]
    def has_day_without_birds?([]), do: false
    def has_day_without_birds?([h | t] = _list) when h == 0, do: true
    def has_day_without_birds?([h | t] = _list) when h != 0, do: has_day_without_birds?(t)
    def total([]), do: 0
    def total([_ | t] = list) do
        cond do
            Enum.count(list) == 1 -> today(list)
            Enum.count(list) > 1 -> today(list) + total(t)
        end
    end
    def busy_days([]), do: 0
    def busy_days([_ | t] = list) do
        if today(list) > 4 do
            1 + busy_days(t)
        else 
            0 + busy_days(t)
        end
    end
end