defmodule FirstGenetic.CLI do
  def main(args \\ []) do
    args =
      args
      |> Enum.map(fn s -> Float.parse(s) |> elem(0) end)

    apply(FirstGenetic, :solve, args)
  end
end
