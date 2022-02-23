defmodule NameBadge do
  def print(id, name, department) do
    name
    |> id(id)
    |> department(department)
  end

  defp id(name, id) do
    if id do
      "[#{id}] - " <> name
    else
      name
    end
  end

  defp department(badge, department) do
    if department do
      badge <> " - #{String.upcase(department)}"
    else
      badge <> " - OWNER"
    end
  end
end
