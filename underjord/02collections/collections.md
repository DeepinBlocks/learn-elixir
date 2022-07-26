# Collection
## Lists
Lists are simple collections of values which may include multiple types; lists my also include non-unique values.
```elixir
list = [3.14, :pie, "Apple"]
```
Elixir implements list collections are linked lists. This means that accessing the list length is an operation that will run in linear time (`O(n)`). For this reason, it is typically faster to prepend than to append.
```elixir
# Prepending (fast)
["$" | list]  # ["$", 3.14, :pie, "Apple"]

# Appending (slow)
list ++ ["Cherry"] # [3.14, :pie, "Apple", "Cherry"]
```
## List concatenation
List concatenation uses the `++/2` operator.
```elixir
[1, 2] ++ [3, 4, 1] # [1, 2, 3, 4, 1]
```
A side note about the name (`++/2`) format used above:  
In Elixir (and Erlang, upon which Elixir is built), a function or operator name has two components: the name you give it (here `++`) and its arity.
Arity is a core part of speaking about Elixir (and Erlang) code. It is the number of arguments a given function takes (two, in this case).
Arity and the given name are combined with a slash. We'll talk more about this later; this knowledge will help you understand the notation for now.
## List Subtraction
Support for subtraction is provided via the `--/2` operator; it's safe to subtract a missing value.
```elixir
["foo", :bar, 42] -- [42, "bar"] # ["foo", :bar]
```
Be mindful of duplicate values. For every element on the right, the first occurrence of it gets removed from the left.
```elixir
[1, 2, 2, 3, 2, 3] -- [1, 2, 3, 2] # [2, 3]
```
Note: List subtraction uses strict comparison to match the values. For example:
```elixir
[2] -- [2.0] # [2]
```
## Head/Tail
When using lists, it is common to work with a list's head and tail. The head is the list's first element, while the tail is a list containing the remaining elements.
Elixir provides two helpful functions, `hd` and `tl`, for working with these parts:
```elixir
hd([3.14, :pie, "Apple"]) # 3.14
tl([3.14, :pie, "Apple"]) # [:pie, "Apple"]
```
In addition to the aforementioned functions, you can se pattern matching and the cons operator `|` to split a list into head and tail. We'll learn more about this pattern in later lessons.
```elixir
[head | tail] = [3.14, :pie, "Apple"]
head # 3.14
tail # [:pie, "Apple"]
```
## Tuples
Tuples ara similar to lists, but are stored contiguously in memory. This makes accessing their length fast but modification expensive; the new tuple must be copied entirely to memory. Tuples are defined with curly braces.
```elixir
{3.14, :pie, "Apple"}
```
It is common for tuples to be used as a mechanism to return additional information from functions; the usefulness of this will be more apparent when we get into pattern matching.
```elixir
File.read("path/to/existing/file") # {:error, :enoent}
```
## Keyword lists
Keyword lists and maps are the associative collections of Elixir. In Elixir, a keyword list is a special list of two-element tuples whose first element is an atom; they share performance with lists.
```elixir
[foo: "bar", hello: "world"]
[{foo: "bar"}, {:hello, "world"}]
```
There three characteristics of keyword lists highlight their importance:
* Keys are atoms.
* Keys are ordered.
* Keys do not have to be unique.
For these reasons, keyword lists are most commonly used to pass options to functions.
## Maps
In Elixir, maps are the "go-to" key-value store. Unlike keyword lists, they allow keys of any type and are un-ordered. You can define a map with the `%{}` syntax.
```elixir
map = %{:foo => "bar", "hello" => "world"}
map[:foo]
map["hello"]
```
As of Elixir 1.2, variables are allowed as map keys:
```elixir
key = "hello"
%{key => "world"}
```
If a duplicate is added to a map, it will replace the former value:
```elixir
%{:foo => "bar", :foo => "hello world"}
```
As we can see the output above, there is a special syntax for maps containing only atom keys.
```elixir
%{foo: "bar", hello: "world"}
%{foo: "bar", hello: "world"} == %{foo => "bar", hello => "world"}
```
In addition, there is a special syntax for accessing atom keys.
```elixir
map = %{foo: "bar", hello: "world"}
map.hello
```
Another interesting property of maps is that they provide their own syntax for updates (note: this creates a new map).
```elixir
map = %{foo: "bar", hello: "world"}
%{map | foo: "baz"}
```
Note: this syntax only works for updating a key that already exists in the map! If the key does not exist, a `KeyError` will be raised.
To create a new key, instead use `Map.put/3`.
```elixir
map = %{hello: "world"}
%{map | foo: "baz"} # error
Map.put(map, :foo, "baz") # ok
```

