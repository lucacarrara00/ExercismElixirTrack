defmodule Lasagna do
    @total_minutes 40
    @time_per_layer 2
    
    def expected_minutes_in_oven, do: @total_minutes
    def remaining_minutes_in_oven(minutes), do: @total_minutes - minutes
    def preparation_time_in_minutes(layers), do: layers * @time_per_layer
    def total_time_in_minutes(layers, minutes), do: minutes + preparation_time_in_minutes(layers)
    def alarm, do: "Ding!"
end