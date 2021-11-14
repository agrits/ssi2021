defmodule FirstGenetic.Selection do
  def select_new_pop(pop, f) do
    probs = population_probabilities_descending(pop, f)

    1..length(probs)
    |> Enum.map(fn _ -> draw_with_probs(probs) end)
  end

  defp population_probabilities_descending(pop, f) do
    f = f |> shift_f(pop)
    sum = f |> f_sum(pop)

    pop
    |> Enum.map(fn x -> {f.(x) / sum, x} end)
    |> Enum.sort(fn {p1, _}, {p2, _} -> p1 >= p2 end)
  end

  defp draw_with_probs(probs) do
    r = :rand.uniform()

    probs
    |> Enum.reduce_while(0, fn {prob, x}, acc ->
      if r < acc + prob do
        {:halt, x}
      else
        {:cont, acc + prob}
      end
    end)
  end

  defp shift_f(f, pop) do
    f_min =
      pop
      |> Enum.map(f)
      |> Enum.min()

    case f_min >= 0 do
      true -> f
      false -> fn x -> f.(x) - f_min end
    end
  end

  defp f_sum(f, pop) do
    pop
    |> Enum.map(&f.(&1))
    |> Enum.sum()
  end
end
