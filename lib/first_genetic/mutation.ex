defmodule FirstGenetic.Mutation do
  def mutate_pop(pop, pr_mut) do
    pop
    |> Enum.map(& &1 |> mutate_specie(pr_mut))
  end

  def mutate_specie(specie, pr_mut) do
    specie
    |> String.to_charlist()
    |> Enum.map(& mutate_gene(&1, pr_mut))
    |> to_string()
  end

  defp mutate_gene(gene, pr_mut) do
    if :rand.uniform() <= pr_mut do
      switch_gene(gene)
    else
      gene
    end
  end

  defp switch_gene(?1), do: '0'

  defp switch_gene(?0), do: '1'
end
