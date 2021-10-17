defmodule FirstGenetic do
  alias FirstGenetic.{Evolution, Setup}
  @global_species_max 150
  @x_max 255
  @x_min 0

  def solve(lb_pop, ile_os, pr_krzyz, pr_mut, a \\ 7, b \\ 4, c \\ 2, ile_wyn \\ 40) when lb_pop*ile_os <= @global_species_max do
    fun = fn x -> quadratic(x, a, b, c) end
    ile_wyn
    |> Setup.generate_n_populations(ile_os, @x_min, @x_max)
    |> Evolution.evolve_populations_n_times(fun, ile_wyn, pr_krzyz, pr_mut)
    |> write_best_species(fun)
  end

  defp write_best_species(pops, f) do
    results =
      pops
      |> Enum.map(& get_best(&1, f))
      |> Enum.map(& "#{f.(&1)} #{&1}")
      |> Enum.join("\n")

    {:ok, file} = File.open("results.tsv", [:write])
    IO.binwrite(file, results)
    file |> File.close()
  end

  defp get_best(pop, f) do
    pop
    |> Enum.max_by(f)
  end


  defp quadratic(specie, a, b, c) do
    a*specie*specie + b*specie + c*specie
  end
end
