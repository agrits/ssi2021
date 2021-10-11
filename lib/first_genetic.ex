defmodule FirstGenetic do
  alias FirstGenetic.{Evolution, Setup}
  @global_species_max 150
  @x_max 255
  @x_min 0

  def solve(lb_pop, ile_os, pr_krzyz, pr_mut, a \\ 7, b \\ 4, c \\ 2, ile_wyn \\ 40) when lb_pop*ile_os <= @global_species_max do
    fun = fn x -> quadratic(x, a, b, c) end
    ile_os
    |> Setup.generate_random_population(@x_min, @x_max)
    |> Evolution.evolve_n_times(fun, ile_wyn, pr_krzyz, pr_mut)
  end

  defp quadratic(specie, a, b, c) do
    a*specie*specie + b*specie + c*specie
  end
end
