defmodule HighSchoolSweetheart do
    def first_letter(name), do: name |> String.trim() |> String.at(0)
    def initial(name) do 
            name |> first_letter() |> String.capitalize() |> Kernel.<>(".")
    end

    def initials(name) do
        String.trim(name)
        list = String.split(name, " ")
        initial(List.first(list)) <> " " <> initial(List.last(list))
    end

    def pair(name1, name2) do
        String.trim(name1)
        String.trim(name2)
        "     ******       ******\n   **      **   **      **\n **         ** **         **\n**            *            **\n**                         **\n**     #{initials(name1)}  +  #{initials(name2)}     **\n **                       **\n   **                   **\n     **               **\n       **           **\n         **       **\n           **   **\n             ***\n              *\n"
    end
end