defmodule FreelancerRates do
    @rate 8.0
    @month_billable_days 22

    def daily_rate(x), do: x * @rate
    def apply_discount(price, discount), do: price * (1 - discount / 100)
    def monthly_rate(hourly_rate, discount), do: trunc(Float.ceil(apply_discount(daily_rate(hourly_rate) * @month_billable_days, discount)))
    def days_in_budget(budget, hourly_rate, discount), do: Float.floor(budget / apply_discount(@rate * hourly_rate, discount), 1)
end