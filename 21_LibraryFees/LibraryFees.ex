defmodule LibraryFees do
  @daily_seconds 24 * 60 * 60

  def datetime_from_string(string), do: string |> NaiveDateTime.from_iso8601!()

  def before_noon?(datetime), do: datetime.hour < 12

  def return_date(checkout_datetime) when checkout_datetime.hour < 12,
    do: checkout_datetime |> NaiveDateTime.add(28 * @daily_seconds) |> NaiveDateTime.to_date()

  def return_date(checkout_datetime),
    do: checkout_datetime |> NaiveDateTime.add(29 * @daily_seconds) |> NaiveDateTime.to_date()

  def days_late(planned_return_date, actual_return_datetime),
    do:
      actual_return_datetime
      |> NaiveDateTime.to_date()
      |> Date.diff(planned_return_date)
      |> max(0)

  def monday?(datetime) do
    datetime = datetime |> NaiveDateTime.to_date()

    with :eq <-
           datetime
           |> Date.beginning_of_week()
           |> Date.compare(datetime) do
      true
    else
      _ ->
        false
    end
  end

  def calculate_late_fee(checkout, return, rate) do
    return = return |> datetime_from_string()

    days =
      checkout
      |> datetime_from_string()
      |> return_date()
      |> days_late(return)

    fee = rate * days

    if return |> monday?() do
      div(fee, 2)
    else
      fee
    end
  end
end
