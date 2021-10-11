defmodule FirstGenetic.Evolution do
  alias FirstGenetic.{Crossing, Encoding, Mutation, Pairing, Selection}
  def evolve_n_times(pop, fun, ile_wyn, pr_krzyz, pr_mut) do
    1..ile_wyn
    |> Enum.reduce(pop,
      fn _i, curr_pop ->
        evolve_population(curr_pop, fun, pr_krzyz, pr_mut)
      end)
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
