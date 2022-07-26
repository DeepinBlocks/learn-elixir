# Getting Start With Elixir

## Design Goals
* Compatibility
* Productivity
* Extensibility

## Characteristics
* General Purpose
  * Suitable for multiple application types.
* Functional
  * Adheres mostly to the functional paradigm, but not only.
* Actor Model
  * Processes are akin to Actors, encapsulating data (state), receiving and sending messages.
* Dynamically Typed
  * Types are interred in compile and run-time.
* Compiled
  * The compiler generates code that is executed by the BEAM (Erlang VM).

## Use Cases
### Good
* General applications.
* Large scale services.
* Web applications.
### Not good
* Systems programming.
* Scripting.

## Functional Programming
### What is functional programming?
* Evaluation of expressions.
* Promotes immutable state.
* Behaves more closely to their mathematical counterpart.
* It is first-class citizen (i.e. can be returned from functions and passwd as argument).
### Motivation
* Better structuring discipline.
* No side effects reduce number of bugs.
* Suitable for parallelism.
### Characteristics
* Higher order functions:
  * Functions as return values and as parameters to other functions.
  * ![avatar](./imgs/func1.png)
* Recursion:
  * Allowing a function to call itself or looping algorithms.
  * ![avatar](./imgs/func2.png)
* Referential Transparency:
  * Some evaluation = some outcome
  * ![avatar](./imgs/func3.png)

## Basic Types and Operators
* Literal types
* Basic operators
* Collection types
* Functions to manipulate collections

### Numbers and Arithmetic Operators
#### Integer
* Integer
  * 1
  * -30
* Floating point
  * 1.54932
  * 1.5e-15
* Integer Bases
  * ![avatar](./imgs/intbases.png)
* Integer - Separator
  * 43312209
  * 43_312_209
* Precision 
#### Operators
![avatar](./imgs/operators.png)
* Integer Division Functions
  * ![avatar](./imgs/intdivision.png)
#### boolean
* True
  * Everything is truthy.
* False
  * nil is false.
* strict
  * `and, or, not`
* non-strict
  * `&&, ||, !`
* Comparison Operators
  * `>, <, >=, <=, !=, !==, ==, ===`
![avatar](./imgs/booloperators.png)
```elixir
15.0 == 15 # true
15.0 === 15 # false
```
* Not just for numbers
  * number < atom < reference < function < port < pid < tuple < map < list < bitstring
* Multiple types can be compared with one another by this order.
### Strings
#### Some functions
* String.reverse
* String.replace
#### Atoms
* A constant whose name is its value.
  * :hello
  * :Hey_you
  * :">_<"
  
## Collection Types
### Lists
* An ordered collection of items
* Delimited by square brackets
* An empty lis, `[]`
```elixir
lst = [:hello, "hey", 4]
```
![avatar](./imgs/list1.png)
```elixir
hd([1,2,3,4,5]) # 1
tl([1,2,3,4,5]) # [2,3,4,5]
tl([1]) # []
```
* The Cons Cell
![avatar](./imgs/conscell.png)
![avatar](./imgs/conscell2.png)
* Concatenation
  * ++
* Subtraction
  * --
```elixir
[:hello, "hey", 4] ++ [0.5] # [:hello, "hey", 4, 0.5]
[:hello, "hey", 4] -- ["hey"] #[:hello, 4]
[:hello, :hello] -- [:hello] # [:hello]
```
### Tuple
* An ordered collection of items
```elixir
{:hello, "hey", 4}
```
#### Functions
* Index
  * elem/2
* Size
  * tuple_size/1
* Replacement
  * put_elem/3
```elixir
elem({:hello, "hey", 4}, 0) # :hello
elem({:hello, "hey", 4}, 2) # "hey"
put_elem({:hello, 2}, 1, :hey) # {:hello, :hey}
```
### Lists vs. Tuples
![avatar](./imgs/listvstuple.png)
### Keyword Lists
* Indexing
```elixir
list = [red: 2, green: 4, blue: 3]
list[:red] # 2
list[:blue] # 3
list[:yellow] # nil
```
* Still lists
  * Indexing is slow
  * Ordered
### Maps
An unordered collection of values indexed by keys.
```elixir
%{:red => 2, :green => 4}
```
* `map[key]`
  * Works with any type of key.
* `map.key`
  * Works only on keys that are atoms.
* `%{map | key => value}`
  * Works with any type of key.
* `%{map | key: value}`
  * Works only on keys that are atoms.
### Maps - Updating
```elixir
map = %{:x => 1, "y" => 2}
%{map | x: 4}
map.x # 1
```
### Immutability
* Collections are Immutable
  * Any modification on a collection returns a new collection.
### Summary
* Literal types in Elixir
  * Number
  * String
  * Atom
* Collection types in Elixir
  * List
  * Tuple
  * Map
* Functions to manipulate these types
* Immutability of collections
* How to compose types to make more complex ones

## Pattern Matching
Assign the value of the list to the variable named `list`.
```elixir
list = [1,2,3,4,5]
```
### The Match Operator
![avatar](./imgs/matchoperator.png)
![avatar](./imgs/matchopeartor2.png)
### Matching Rules
![avatar](./imgs/matchrule.png)
![avatar](./imgs/matchrule2.png)
![avatar](./imgs/matchrule3.png)
### Pin Operator
![avatar](./imgs/pinoperator.png)
```elixir
x = "hello"
x = "hey"
^x = "apple" # error
```

## Forms of Pattern Matching
### Pattern Matching Revisited
![avatar](./imgs/form.png)
```elixir
[x, 2, 3] = [1, 2, 3]
x # 1
```
![avatar](./imgs/form2.png)
```elixir
[x|[2,3]] = [1, 2, 3]
```
![avatar](./imgs/form3.png)
![avatar](./imgs/form4.png)
![avatar](./imgs/form5.png)
### A New Type
```elixir
<<1, 2, 3>> <> <<4>>
<<1, 2, 3, 4>>
```
![avatar](./imgs/binarylist.png)
```elixir
<<65, "broad">> # "Abroad"
```
### A New Problem
![img.png](imgs/fif.png)
```elixir
<<0xCAFE::16,
width::16,
height::16,
pixel_size,
image_data::binary>> = <<...>>
```

## Functions
### What is a function?
![avatar](./imgs/functions.png)
### Why functions?
* Reuse computations
* Combine to express more powerful computations
### A function in Elixir
![avatar](./imgs/functions2.png)

### Function Notation
Elixir allows the definition of functions with the same name but with different arity.
### Default Arguments
![avatar](./imgs/functions3.png)
### Chaining Function Calls
![avatar](./imgs/functions4.png)
```elixir
person |> full_name |> say_hello("jeff")
```
Inject the value on the left as the first argument of the function on the right.
![avatar](./imgs/functionpipe.png)

## Modules
A group of closely related functions.
### Modules in Elixir
![avatar](./imgs/module.png)
### Calling a function from a module
```elixir
BasicMath.add(2, 5) # 7
```
### Composing Modules
![avatar](./imgs/composemodule.png)
![avatar](./imgs/composemodule2.png)
![avatar](./imgs/composemodule3.png)
![avatar](./imgs/composemodule4.png)
* alias
  * Reference a module by different name.
* import
  * Include the functions of a module.
### Private functions
![avatar](./imgs/privatefunctions.png)
### Constants
![avatar](./imgs/constants.png)

## Pattern matching in functions
### The Factorial Function
```elixir
def fact(n) do
  if (n > 0) do
    n * fact(n - 1)
  else
    1
  end
end
```
This is perfectly fine, but we can do better.
```elixir
def fact(0) do
  1
end
def fact(n) do
  n * fact(n - 1)
end
```
### Pattern Matching
```elixir
def process({:ok, result}) do
  result
end
def process({:error, _}) do
  :failure
end
def process(_) do
  :unknown
end
```
### Guard Clauses
```elixir
def fact(n) when is_integer(n) and n > 0 do
  n * fact(n - 1)
end
```
### The final Factorial Function
```elixir
def fact(0) do
  1
end
def fact(n) when is_integer(n) and n > 0 do
  n * fact(n - 1)
end
def fact(_) do
  0
end
```
## Anonymous Functions
### Validation
Build a function that validates that a person's age is above 18.
```elixir
%{name: "Jack", age: 30}

def validate(person) do
  person.age > 18
end

def validate2(person) do
  person.age > 20 and person.age < 60
end
```
### Anonymous Functions
```elixir
fn (person) ->
  person.age > 18
end

&(&1.age > 18)
```
```elixir
def validate(person, validation) do
  validation.(person)
end

person = %{name: "Jill", age: 19}
Validation.validate(person, &(&1.age > 18))
Validation.validate(person, &(&1.age > 20 and &1.age < 60))
```
### High Order Functions
* Receive functions as arguments
* Return functions
### The Enum Module
Take out all the odd numbers, multiply each number by itself and count the ones above 20.
```elixir
list = [1,2,3,4,5,6,7,8,9,19]

def do_it(list) do
  list
  |> Enum.reject(&(is_odd(&1)))
  |> Enum.map(&BasicMath.square/1)
  |> Enum.count(&(&1 > 20))
end

do_it(list)
```

## Recursion
### An old function
```elixir
def fact(0) do
  1
end

def fact(n) do
  n * fact(n - 1)
end
```
### Recursion
* Method of dividing complex problems into smaller ones.
* Define a base case.
* Compute the solution converging towards the base case.
### Base Case
```elixir
def fact(0) do
  1
end
```
### General function
```elixir
def fact(n) do
  n * fact(n - 1)
end
```
### A Different Problem
Count the number of nodes in the graph.  
![avatar](./imgs/tree.png)
* Base case
  * Nodes with no children yield count 1.
```elixir
def count(%{children: []}) do
  1
end
```
* General function
  * Count the nodes of the first child and add them to the count of the nodes of the rest of the children.
```elixir
def count(%{children: children}) do
  [first|rest] = children
  count(first) + count(%{children: rest})
end
```
```elixir
graph = %{
  children: [
    %{children: []},
    %{children: []},
    %{children: [
      %{children: []},
      %{children: []}
    ]},
    %{children: []}
  ]
}
 
defmodule Graph do
  def count(%{children: []}) do
    #IO.inspect(:inc);
    1
  end
  def count(%{children: children}) do
    #IO.inspect(:yyyyyyyyyyyyyyyyyyyyyyyyyy)
    [first|rest] = children
    #IO.inspect(first)
    #IO.inspect(rest)
    count(first) + count(%{children: rest})
  end
end

graph |> Graph.count() # 7
```

## Conditions
Classifying a list according to its size.
```elixir
def classify([]), do: :empty
def classify([_]), do: :single
def classify([_|_]), do: :multi
```
### Cond
When an expression evaluates to true, the body is executed.
```elixir
cond do
  expression -> body
  expression -> body
  # ...
end
```
```elixir
def discount(age) do
  cond do
    age < 12 -> 0.6
    age >= 65 -> 0.4
    true -> 0.0 # default case
  end
end
```
### Case
When a pattern matches the value of the expression, the body is executed.
```elixir
case expression do
  pattern -> body
  pattern -> body
  # ...
end
```
```elixir
def discount(category) do
  case category do
    :child -> 0.6
    :senior -> 0.4
    _ -> 0.0 # default case
  end
end
```
### If/Else
When an expression evaluates to true, the `if_body` is executed, otherwise the `else_body` is executed (if present).
```elixir
if expression do
  # if_body
end
if expression do
  # if_body
else
  # else_body  
end
```
When an expression evaluates to false, the `unless_body` is executed.
```elixir
unless expression do
  # unless_body
end
```
```elixir
def show_price(name, price) do
  discount = name
    |> Customer.find
    |> Customer.categorise
    |> Pricing.discount
    
  price * (1.0 - discount)
end
```
### With
If all patterns match, body is executed. When an expression doesn't match, its value is returned.
```elixir
with
  pattern <- expression
  pattern <- expression
  # ...
do
  body
end
```
```elixir
def show_price(name, price) do
  with
    {:ok, person} <- Customer.find(name),
    {:ok, category} <- Customer.categorise(person),
    {:ok, discount} <- Pricing.discount(category)
  do
    {:ok, price * (1.0 - discount)}
  end
end
```

## Exception Handling
Exception handing like this should be used only as last resort and never for control flow.
```elixir
def yell_at(name) do
  try_do
    "Hey #{String.upcase(name)}"
  rescue
    e -> "Hey stranger!"
  end
end
```
### Raising Exceptions
```elixir
defmodule MyError do
  defexception message: "A strange error", 
               number: 33
end

raise MyError, number: 1000
```
### Rescuing from Custom Exceptions
```elixir
def catch_me() do
  try do
    raise MyError, number: 9023
  rescue
    e in MyError -> e.number
  after
    IO.puts("I failed here")  
  end
end
```
### Throwing and Catching
`throw/catch` is far more suited for this purpose.
```elixir
def catch_me() do
  try do
    throw %{number: 9023}
  catch
    e -> e.number
  end
end
```

## IO
### The Standard IO
![avatar](./imgs/stdio.png)
### IO Module
![avatar](./imgs/iomodule.png)
### ANSI Formatting
![avatar](./imgs/ioansi.png)


## Files
### The File Module
Most of these functions are the same as the commands we'd use on *NIX command line.
![avatar](./imgs/filemodule.png)
### Creating a Directory
```elixir
File.mkdir("notes/today")
File.write("notes/today/one.txt", "Hello")
File.read("notes/today/one.txt")
File.rm("notes/today/one.txt")
```
### Open + Close
Use this principle when doing a lot of IO operation on a file.
```elixir
def write_list(path, list) do
  with {:ok, file} <- File.open(path, [:write, :utf8]) do
    list
      |> Enum.each(fn(line) -> IO.write(file, line) end)
    File.close(file)
  end
end
```

## Creating an Application
### The Application
![avatar](./imgs/app.png)
### Mix
* Creating Applications
* Run Tests
* Compile Application
* Import Dependencies
* Compile Dependencies
* Custom tasks
### Creating an Application
```
mix new gif_generator
iex -S mix
GifGenerator.hello
````
### Anatomy of an Application
![avatar](./imgs/appanatomy.png)


## Import Dependencies
```
mix deps.get
mix deps.compile
iex -S mix
```

## Tests
