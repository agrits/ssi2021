defmodule FirstGenetic.Crossing do
  def cross_pairs(pairs, pr_krzyz) do
    pairs
    |> Enum.map(& &1 |> cross(pr_krzyz))
  end

  defp cross({specie1, specie2} = pair, pr_krzyz) do
    case should_cross?(pr_krzyz) do
      true ->
        cp = random_cutting_point()
        {left1, right1} = specie1 |> String.split_at(cp)
        {left2, right2} = specie2 |> String.split_at(cp)
        child1 = left1 <> right2
        child2 = left2 <> right1
        {child1, child2}

      false -> pair
    end
  end

  defp should_cross?(pr_krzyz) do
    :rand.uniform() <= pr_krzyz
  end

  defp random_cutting_point() do
    round(:rand.uniform*6)+1
  end
end
