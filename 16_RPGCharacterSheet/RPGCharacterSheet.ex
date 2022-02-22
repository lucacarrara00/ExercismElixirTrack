defmodule RPG.CharacterSheet do
  def welcome() do
    IO.puts("Welcome! Let's fill out your character sheet together.")
  end

  def ask_name() do
    IO.gets("What is your character's name?\n")
    |> render_string()
  end

  def ask_class() do
    IO.gets("What is your character's class?\n")
    |> render_string()
  end

  def ask_level() do
    IO.gets("What is your character's level?\n")
    |> render_string()
    |> String.to_integer()
  end

  def run() do
    welcome()

    IO.inspect(
      %{
        name: ask_name(),
        class: ask_class(),
        level: ask_level()
      },
      label: "Your character"
    )
  end

  defp render_string(str) do
    str
    |> String.trim()
    |> String.replace("\\n", "")
  end
end
