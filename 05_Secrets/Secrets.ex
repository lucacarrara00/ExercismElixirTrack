defmodule Secrets do
import Bitwise

    def secret_add(number), do: fn x -> x + number end
    def secret_subtract(number), do: fn x -> x - number end
    def secret_multiply(number), do: fn x -> x * number end
    def secret_divide(number), do: fn x -> div(x, number) end
    def secret_and(number), do: fn x -> x &&& number end
    def secret_xor(number), do: fn x -> bxor(x, number) end
    def secret_combine(secret_multiply, secret_divide), do: fn x -> secret_divide.(secret_multiply.(x)) end
end