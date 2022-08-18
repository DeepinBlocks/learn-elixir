# Advanced Elixir
## Enumerables
### Collection Types
Data types that allow the composition of other data types.
```elixir
list = [1, 2, 3, 4]
map = %{one: 1, two: 2}
Enum.at(list, 0)
Enum.at(map, 0)

defmodule Sizeable do
  def first(enum) do
    Enum.at(num, 0)
  end
end

Sizeable.first(map)
```
### Enumerable
A protocol that blinds Enumerable collection types.
* Collections have a variable number of elements.
* One can verify if an element belongs to a collection.
* Collections can be reduced by means of a function and an accumulator.
### Transformations
Transforming collections by filtering, mapping, and reducing their elements.
```elixir
1..1000 |> Enum.filter(fn(x) -> rem(x, 2) == 0 end)

1..1000 |> Enum.filter(fn(x) -> rem(x, 2) == 0 end)
        |> Enum.map(fn(x) -> x * x end)

1..10 |> Enum.filter(fn(x) -> x < 10 and (rem(x, 3) == 0 or rem(x, 5) == 0) end) 
      |> Enum.reduce(0, fn(x, acc)-> x + acc end)

1..999 |> Enum.filter(fn(x) -> rem(x, 3) == 0 or rem(x, 5) == 0 end) 
       |> Enum.reduce(0, fn(x, acc)-> x + acc end)
```
## Streams
## Defining Protocols
## Implementing Protocols
## Launching and Linking
## Messaging





