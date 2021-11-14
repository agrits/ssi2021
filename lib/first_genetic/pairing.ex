defmodule FirstGenetic.Pairing do
  def pairs_to_pop(pairs) do
    pairs
    |> Enum.reduce([], fn pair, acc -> acc ++ Tuple.to_list(pair) end)
  end

  def find_pairs(pop) do
    pop
    |> Enum.reduce_while({[], pop}, &new_pair/2)
    |> elem(0)
  end

  defp new_pair(_, {_pairs, []} = acc) do
    {:halt, acc}
  end

  defp new_pair(_, {pairs, mates_left}) do
    [head | tail] = mates_left
    idx = round(:rand.uniform() * (length(mates_left) - 2))

    pair = {head, tail |> Enum.at(idx)}

    new_mates_left = (tail |> Enum.take(idx)) ++ (tail |> Enum.drop(idx + 1))
    {:cont, {pairs ++ [pair], new_mates_left}}
  end
end
