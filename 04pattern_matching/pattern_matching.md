# Pattern Matching

## Pattern Matching
Pattern matching is a powerful part of Elixir. It allows us to match simple values, data structures, and even functions.
In this lesson we will begin to see how pattern matching is used.

## Match Operator
Are you ready for a curveball? In Elixir, the `=` operator is actually a match operator, comparable to the equals sign in 
algebra. Writing it turns the whole expression into an equation and makes Elixir match the values on the left hand with the
values on the right hand. If the match succeeds, it returns the value of the equation. Otherwise, it throws an error.
```elixir
x = 1
x
```
Now let's try some simple matching.
```elixir
1 = x
2 = x # error
```
Let's try that with some of the collections we know.
```elixir
list = [1, 2, 3]
[1, 2, 3] = list
[] = list               # error
[1 | tail] = list
tail                    # [2, 3]
[2 | _] = list          # error
# Tuples
{:ok, value} = {:ok, "Successful!"}
value                   # "Successful"
{:ok, value} = {:error} # error
```

## Pin Operator
The match operator performs assignment when the left side of the match includes a variable. In some cases this variable
rebinding behavior is undesirable For these situations we have the pin operator: `^`.  
When we pin a variable we match on the existing value rather than rebinding to a new one.
```elixir
x = 1
^x = 2  # error
{x, ^x} = {2, 1}
x       # 2
```
Elixir 1.2 introduces support for pins in map keys and functions clauses.
```elixir
key = "hello"
%{^key => value} = %{"hello" => "world"}
value
```
An example of pinning in a function clause.
```elixir
greeing = "Hello"
greet = fn
    ^greeting, name -> IO.puts("Hi #{name}")
    greeting, name -> IO.puts("#{greeting}, #{name}")
end
greet.("Hello", "Sean")
greet.("Mornin'", "Sean")
greeting

a = %{foo: "bar", baz: 5}
a.foo
a[:foo]
%{foo: my_value, baz: my_value2} = a
def hello(%{foo: x, baz: y} = a) do
    IO.puts(x)
    %{a | foo: x*2}
end_
```
Note in the `"Mornin'"` example that the reassignment of `greeting` to `"Mornin'"` only happens inside the function. 
Outside the function `greeting` is still `Hello`.