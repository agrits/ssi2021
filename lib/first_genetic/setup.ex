defmodule FirstGenetic.Setup do

  def generate_n_populations(n, m, x_min, x_max) do
    Enum.map(1..n, fn _ -> generate_random_population(m, x_min, x_max) end)
  end

  defp generate_random_population(n, x_min, x_max) do
    Enum.map(1..n, fn _ -> round(:rand.uniform() * (x_max-x_min) + x_min) end)
  end
end
