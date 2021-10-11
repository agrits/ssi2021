defmodule FirstGenetic.Selection do
  def select_new_pop(probs) do
    1..length(probs)
    |> Enum.map(fn _ -> draw_with_probs(probs) end)
  end

  def population_probabilities_descending(pop, f) do
    sum = f_sum(pop, f)
    pop
    |> Enum.map(fn x -> {f.(x)/sum, x} end)
    |> Enum.sort(fn {p1, _}, {p2, _} -> p1 >= p2 end)
  end

  defp draw_with_probs(probs) do
    r = :rand.uniform()
    probs
    |> Enum.reduce_while(0, fn {prob, x}, acc ->
      if r <= acc + prob do
        {:halt, x}
      else
        {:cont, acc + prob}
      end
    end)
  end

  defp f_sum(pop, f) do
    pop
    |> Enum.map(& f.(&1))
    |> Enum.sum()
  end
end
