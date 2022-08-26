# Use the Plot struct as it is provided
defmodule Plot do
  @enforce_keys [:plot_id, :registered_to]
  defstruct [:plot_id, :registered_to]
end

defmodule CommunityGarden do
  def start(opts \\ []), do: Agent.start(fn -> opts end)

  def list_registrations(pid),
    do:
      Agent.get(pid, fn plots ->
        plots
      end)

  def register(pid, register_to) do
    plot = %Plot{
      plot_id: :rand.uniform(99999),
      registered_to: register_to
    }

    Agent.update(pid, fn plots -> [plot | plots] end)

    plot
  end

  def release(pid, plot_id),
    do:
      pid
      |> Agent.update(fn plots ->
        plots
        |> Enum.filter(fn plot ->
          plot.plot_id != plot_id
        end)
      end)

  def get_registration(pid, plot_id),
    do:
      pid
      |> Agent.get(fn plots ->
        plots
        |> Enum.find({:not_found, "plot is unregistered"}, fn plot ->
          plot.plot_id == plot_id
        end)
      end)
end
