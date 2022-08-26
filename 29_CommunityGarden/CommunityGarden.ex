# Use the Plot struct as it is provided
defmodule Plot do
  @enforce_keys [:plot_id, :registered_to]
  defstruct [:plot_id, :registered_to]
end

defmodule CommunityGarden do
  def start(opts \\ []), do: Agent.start(fn -> opts end)

  def list_registrations(pid),
    do: Agent.get(pid, & &1)

  def register(pid, register_to) do
    plot = %Plot{
      plot_id: :rand.uniform(99999),
      registered_to: register_to
    }

    Agent.update(pid, &[plot | &1])

    plot
  end

  def release(pid, plot_id),
    do:
      pid
      |> Agent.update(
        &(&1
          |> Enum.filter(fn plot ->
            plot.plot_id != plot_id
          end))
      )

  def get_registration(pid, plot_id),
    do:
      pid
      |> Agent.get(
        &(&1
          |> Enum.find({:not_found, "plot is unregistered"}, fn plot ->
            plot.plot_id == plot_id
          end))
      )
end
