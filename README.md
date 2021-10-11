# First GA assignment

## Requirements
In order to run you'd need Elixir and Erlang in your environment. I recommend to use [asdf](https://github.com/asdf-vm/asdf), since you've got `.tool-versions` available:
```
asdf install
```

## Execution
Enter IEx shell from project root:
```
> iex -S mix
```

Run the algorithm with designated parameters:
```
iex(1)> FirstGenetic.solve(1,40,0.9,0.005)
[252, 252, 248, 236, 232, 233, 252, 232, 235, 231, 244, 231, 231, 234, 255, 235,
 232, 251, 254, 251, 235, 248, 251, 254, 254, 234, 252, 253, 231, 248, 251, 244,
 250, 251, 250, 248, 251, 239, 235, 251]
```


