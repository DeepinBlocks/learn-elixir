# Enum
The `Enum` module includes over 70 functions for working with enumerables. All the collections that we learned about in
the previous lesson except tuples are enumerables.  
The lesson will only cover a subset of the variable functions, however we can actually examine them ourselves. Let's do 
a little experiment in IEX.
```elixir
Enum.__info__(:functions) |> Enum.each(fn({function, arity}) ->
  IO.puts "#{function}/#{arity}"
end)
```
Using this, it's clear that we have a vast amount of functionality, and that is for a clear reason. Enumeration is at the
core of functional programming, and combined with other perks of Elixir it can be incredibly empowering for developers.  
For a full list of functions visit the official `Enum` docs; for lazy enumeration use the `Stream` module.

## all?
When using `all?/2`, and much of `Enum`, we supply a function to apply to our collection's items. In the case of `all?/2`,
the entire collection must evaluate to `true` otherwise `false` will be returned.
```elixir
Enum.all?(["foo", "bar", "hello"], fn(s) -> String.length(s) == 3 end) # false
Enum.all?(["foo", "bar", "hello"], fn(s) -> String.length(s) > 1 end)  # true
```

## any?
Unlike the above, `any?/2` will return `true` if at least one item evaluates to `true`.
```elixir
Enum.any?(["foo", "bar", "hello"], fn s -> String.length(s) == 5 end) # true
```

## chunk_every (拆分成更小的数组)
If you need to your collection up into smaller groups, `chunk_every/2` is the function you're probably looking for.
```elixir
Enum.chunk_every([1, 2, 3, 4, 5, 6], 4) # [[1, 2, 3, 4], [5, 6]]
```
There are a few options for `chunk_every/4` but we won't go into them, checkout out `official documentation of this function` 
to learn more.

## chunk_by (按某个属性分组)
If we need to group our collection based on something other than size, we can use `chunk_by/2` function. It takes a given
enumerable and a function, and when the return on that function changes a new group is started and begins the creation of the next.
```elixir
# [["one", "two"], ["three"], ["four", "five"]]
Enum.chunk_by(["one", "two", "three", "four", "five"], fn x -> String.length(x) end) 
# [["one", "two"], ["three"], ["four", "five"], ["six"]]
Enum.chunk_by(["one", "two", "three", "four", "five", "six"], fn x -> String.length(x) end) 
```

## map_every
Sometimes chunking out a collection isn't enough for exactly what we may need. If this is the case, `map_every/3` can be 
very useful to hit every `nth` items, always hitting the first one.
```elixir
# Apply function every three items
Enum.map_every([1, 2, 3, 4, 5, 6, 7, 8], 3, fn x -> x + 1000 end) # [1001, 2, 3, 1004, 5, 6, 1007, 8]
```

## each (将函数作用于每个元素上，返回:ok)
It may be necessary to iterate over a collection without producing a new value, for this case use `each/2`.
```elixir
Enum.each(["one", "two", "three"], fn s -> IO.puts s end)
Enum.each([1, 2, 3], fn s -> s * 2 end)
```
Note: The `each/2` function does return the atom `:ok`.

## map (将函数作用于每个元素上，返回新集合)
To apply our function to each item and produce a new collection look to the `map/2` function.
```elixir
Enum.map([0, 1, 2, 3], fn(x) -> x - 1 end)
Enum.map(%{foo: 1, bar: 2}, fn x -> x end)
```

## min
`min/1` finds the minimal value in the collection.
```elixir
Enum.min([5, 3, 0, -1])
```
`min/2` does the same, but in case the enumerable is empty, it allows us to specify a function to produce the minimum value.
```elixir
Enum.min([], fn -> :foo end)
```

## max
`max/1` returns the maximal value in the collection.
```elixir
Enum.max([5, 3, 0, -1])
```
`max/2` is to `max/1` what `min/2` is to `min/1`.
```elixir
Enum.max([], fn -> :bar end)
```

## filter
The `filter/2` function enables us to filter the collection to include only those elements that evaluate to `true` using the provided function.
```elixir
Enum.filter([1, 2, 3, 4], fn x -> rem(x, 2) == 0 end)
```

## reduce
With `reduce/3` we can distill our collection down into a single value. To do this we supply an optional accumulator (`10`
in this example) to be passed into our function; if no accumulator is provided the first element in the enumerable is used.
```elixir
Enum.reduce([1, 2, 3], 10, fn x, acc -> x + acc end) # 16
Enum.reduce([1, 2, 3], fn x, acc -> x + acc end) # 6
Enum.reduce(["a", "b", "c"], "1", fn x, acc -> x <> acc end) # "abc1"
```

## sort
Sorting our collections is made easy with not one, but two, sorting functions.  
`sort/1` uses Erlang's term ordering to determine the sorted order.
```elixir
Enum.sort([5, 6, 1, 3, -1, 4]) # [-1, 1, 3, 4, 5, 6]
Enum.sort([:foo, "bar", Enum, -1, 4]) # [-1, 4, Enum, :foo, "bar"]
```
While `sort/2` allows us to provide a sorting function of our own.
```elixir
Enum.sort([%{:val => 4}, %{:val => 1}], fn x, y -> x[:val] > y[:val] end) # [%{val: 4}, %{val: 1}]
Enum.sort([%{:count => 4}, %{:count => 1}]) # [%{val: 1}, %{val: 4}]
```
For convenience, `sort/2` allows us to pass `:asc` or `:desc` as the sorting function.
```elixir
Enum.sort([2, 3, 1], :desc)
```

## uniq
We can use `uniq/1` to remove duplicates from our enumerables.
```elixir
Enum.uniq([1, 2, 3, 2, 1, 1, 1, 1, 1])
```

## uniq_by
`uniq_by/2` also removes duplicates from enumerables, but it allows us to provide a function to do the uniqueness comparison.
```elixir
Enum.uniq_by([%{x: 1, y: 1}, %{x: 2, y: 1}, %{x: 3, y: 3}], fn coord -> coord.y end)
```
## Enum using the Capture operator (&)
Many functions within the Enum module in Elixir take anonymous functions as an argument to work with each iterable of the
enumerable that is passed.  
These anonymous functions are often written shorthand using the Capture operator (&).  
Here are some examples that show the capture operator can be implemented with the Enum module. Each version is functionally equivalent.
### Using the capture operator with an anonymous function
Below is a typical example of the standard syntax when passing an anonymous function to `Enum.map/2`.
```elixir
Enum.map([1, 2, 3], fn n -> x + 3 end)
```
Now we implement the capture operator (&); capturing each iterable of the list of numbers ([1,2,3]) and assign each iterable
to the variable &1 as it is passed through the mapping function.
```elixir
Enum.map([1, 2 ,3], &(&1 + 3))
```
This can be further refactored to assign the prior anonymous function featuring the Capture operator to a variable and called
from the `Enum.map/2` function.
```elixir
plus_three = &(&1 + 3)
Enum.map([1, 2, 3], plus_three)
```
## Using the capture operator with a named function
First we create a named function and call it within the anonymous function defined in `Enum.map/2`.
```elixir
defmodule Adding do
  def plus_three(number), do: number + 3
end
Enum.map([1, 2, 3], fn number -> Adding.plus_three(number) end)
```
Next we can refactor to use the Capture operator.
```elixir
Enum.map([1, 2, 3], &Adding.plus_three(&1))
```
For the most succinct syntax, we can directly call the named function without explicitly capturing the variable.
```elixir
Enum.map([1, 2, 3], &Adding.plus_three/1)
Enum.reject([%{repo: "foo", archived: true}, %{repo: "bar", archived: false}, %{repo: "baz", archived: false}], fn repo -> repo.archived end)
```