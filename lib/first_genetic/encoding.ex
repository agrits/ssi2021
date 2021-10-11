defmodule FirstGenetic.Encoding do
  def encode_pop(pop) do
    pop |> Enum.map(&to_binary/1)
  end

  def decode_pop(pop) do
    pop
    |> Enum.map(&decode_specie/1)
  end

  defp to_binary(x) do
    x |> Integer.to_string(2) |> String.pad_leading(8, "0")
  end

  defp decode_specie(specie) do
    {x, _} = specie |> Integer.parse(2)
    x
  end
end
