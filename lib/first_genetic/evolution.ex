defmodule FirstGenetic.Evolution do
  alias FirstGenetic.{Crossing, Encoding, Mutation, Pairing, Selection}

  def evolve_populations_n_times(pops, _fun, 0, _pr_krzyz, _pr_mut), do: pops
  def evolve_populations_n_times(pops, fun, ile_wyn, pr_krzyz, pr_mut) do
    pops
    |> Enum.map(& evolve_population(&1, fun, pr_krzyz, pr_mut))
    |> inspect_max(fun)
    |> evolve_populations_n_times(fun, ile_wyn-1, pr_krzyz, pr_mut)
  end

  defp inspect_max(pops, f) do
    best =
      pops
      |> Enum.flat_map(& &1)
      |> Enum.max_by(f)

    IO.inspect("Best: #{best}, f(Best): #{f.(best)}")

    pops
  end

  defp evolve_population(population, f, pr_krzyz, pr_mut) do
    population
    |> Encoding.encode_pop()
    |> Pairing.find_pairs()
    |> Crossing.cross_pairs(pr_krzyz)
    |> Pairing.pairs_to_pop()
    |> Mutation.mutate_pop(pr_mut)
    |> Encoding.decode_pop()
    |> Selection.population_probabilities_descending(& f.(&1))
    |> Selection.select_new_pop()
  end
end
