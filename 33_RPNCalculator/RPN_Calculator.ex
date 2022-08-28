defmodule RPNCalculator do
  def calculate!(stack, operation), do: stack |> operation.()

  def calculate(stack, operation) do
    try do
      {:ok, stack |> operation.()}
    rescue
      _e -> :error
    end
  end

  def calculate_verbose(stack, operation) do
    try do
      {:ok, stack |> operation.()}
    rescue
      e in ArgumentError -> {:error, e.message}
    end
  end
end
