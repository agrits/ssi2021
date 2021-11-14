defmodule FirstGenetic.Evolution do
  alias FirstGenetic.{Crossing, Encoding, Mutation, Pairing, Selection}

  def evolve_populations_n_times(pops, _fun, 1, _pr_krzyz, _pr_mut), do: pops

  def evolve_populations_n_times(pops, fun, lb_pop, pr_krzyz, pr_mut) do
    pops
    |> Enum.map(&evolve_population(&1, fun, pr_krzyz, pr_mut))
    |> evolve_populations_n_times(fun, lb_pop - 1, pr_krzyz, pr_mut)
  end

  defp evolve_population(population, f, pr_krzyz, pr_mut) do
    population
    |> Encoding.encode_pop()
    |> Pairing.find_pairs()
    |> Crossing.cross_pairs(pr_krzyz)
    |> Pairing.pairs_to_pop()
    |> Mutation.mutate_pop(pr_mut)
    |> Encoding.decode_pop()
    |> Selection.select_new_pop(f)
  end
end
