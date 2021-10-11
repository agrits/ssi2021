defmodule FirstGenetic.Setup do
  def generate_random_population(n, x_min, x_max) do
    Enum.map(1..n, fn _ -> round(:rand.uniform() * (x_max-x_min) + x_min) end)
  end
end
