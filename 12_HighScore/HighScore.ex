defmodule HighScore do
@def_score 0

    def new, do: Map.new()
    def add_player(map, player, score \\ @def_score), do: Map.put(map, player, score)
    def remove_player(map, player), do: Map.delete(map, player)
    def reset_score(map, player), do: Map.put(map, player, @def_score)
    def update_score(map, player, value) do
        if map[player] == nil do
            add_player(map, player, value)
        else 
            Map.replace(map, player, value + Map.get(map, player))
        end
    end
    def get_players(map), do: Map.keys(map)
end