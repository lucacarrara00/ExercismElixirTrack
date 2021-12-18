defmodule KitchenCalculator do
@cup 240
@fluid 30
@teaspoon 5
@tablespoon 15

    def get_volume(tuple), do: elem(tuple, 1)

    def to_milliliter({:milliliter, x}), do: {:milliliter, x}
    def to_milliliter({:cup, x}), do: {:milliliter, x * @cup}
    def to_milliliter({:fluid_ounce, x}), do: {:milliliter, x * @fluid}
    def to_milliliter({:teaspoon, x}), do: {:milliliter, x * @teaspoon}
    def to_milliliter({:tablespoon, x}), do: {:milliliter, x * @tablespoon}

    def from_milliliter({:milliliter, x}, :milliliter), do: {:milliliter, x}
    def from_milliliter({:milliliter, x}, :cup), do: {:cup, x / @cup}
    def from_milliliter({:milliliter, x}, :fluid_ounce), do: {:fluid_ounce, x / @fluid}
    def from_milliliter({:milliliter, x}, :teaspoon), do: {:teaspoon, x / @teaspoon}
    def from_milliliter({:milliliter, x}, :tablespoon), do: {:tablespoon, x / @tablespoon}

    def convert({:milliliter, x}, atom), do: from_milliliter({:milliliter, x}, atom)
    def convert({:cup, x}, atom), do: from_milliliter(to_milliliter({:cup, x}), atom)
    def convert({:fluid_ounce, x}, atom), do: from_milliliter(to_milliliter({:fluid_ounce, x}), atom)
    def convert({:teaspoon, x}, atom), do: from_milliliter(to_milliliter({:teaspoon, x}), atom)
    def convert({:tablespoon, x}, atom), do: from_milliliter(to_milliliter({:tablespoon, x}), atom)

end