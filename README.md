# First GA assignment

## Requirements
In order to run you'd need Elixir and Erlang in your environment. I recommend to use [asdf](https://github.com/asdf-vm/asdf), since you've got `.tool-versions` available:
```
asdf install
```

## Arguments

In order:
```
lb_pop, ile_os, pr_krzyz, pr_mut, a \\ 7, b \\ 4, c \\ 2, ile_wyn \\ 40
```

## Execution
Enter IEx shell from project root:
```
> iex -S mix
```

Run the algorithm with designated parameters:
```
iex(1)> FirstGenetic.solve(1,40,0.9,0.005)
```

or build escript with `mix escript.build` and run with desired arguments by 
```
./first_genetic 1 40 0.9 0.005
```

