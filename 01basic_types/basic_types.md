# Basic Data Types
## Integers
Support for binary, octal, and hexadecimal number comes built in.
```elixir
0o644 # 420
420
0x1F # 31
```
## Floats
In elixir, floating point numbers require a decimal after at least one digit; they have 64-bit double precision and support `e` for exponent values.
```elixir
1.0e-1 + 3.14e-2
```
## Booleans
Elixir supports `true` and `false` as booleans; everything is truthy except for `false` and `nil`.
## Atoms
An atom is a constant whose name is its value. If you're familiar with Ruby, these are synonymous with Symbols.
```elixir
:foo = :bar # false
```
The booleans `true` and `false` ara also the atoms `:true` and `:false`, respectively.
```elixir
is_atom(true)    # true
is_boolean(true) # true
:true === :true  # true
```
Names of modules in Elixir are also atoms. `MyApp.MyModule` is a valid atom, even if no such module has been declared yet.
```elixir
is_atom(MyApp.MyModule)
```
Atoms are also used to reference modules from Erlang libraries, including built in ones.
```elixir
:crypto.strong_rand_bytes(3)
```
## Strings
Strings in Elixir are UTF-8 encoded and are wrapped in double quotes.
Strings support line breaks and escape sequences.
```elixir
"foo
bar"
"foo\nbar"
```
## Basic Operations
### Arithmetic
Elixir supports the basic operators `+`,`-`,`*` and `/` as you would expect. It's important to remember that `/` will always return a float.
```elixir
2 + 2
2 - 1
2 * 5
10 / 5 # 2.0
```
If you need integer division or the division remainder(i.e., modulo), Elixir comes with two helpful functions to achieve this.
```elixir
div(10, 5) # 2
rem(10, 3) # 1
```
### Boolean
Elixir provides the `||`, `&&` and `!` boolean operators. These support any types.
```elixir
-20 || true  # -20
fasle || 42  # 42
42 && true   # true
42 && nil    # nil
!42          # false
!false       # true
```
There are three additional operators whose first argument must be a boolean(`true` or `false`).
```elixir
true and 42   # 42
false or true # true
not false     # true
42 and true   # error
not 42        # error
```
Note: Elixir's `and` and `or` actually map to `andolso` and `orelse` in Erlang.
### Comparison
Elixir comes with all the comparison operators we're used to: `==`, `!=`, `===`, `!==`, `>=`, `<=`, `<` and `>`.
```elixir
1 > 2  # false
1 != 2 # true
2 == 2 # true
2 <= 3 # true
```
For strict comparison of integers and floats, use `===`.
```elixir
2 == 2.0  # true
2 === 2.0 # false
```
An important feature of Elixir is that any two types can be compared; this is particularly useful in sorting. We don't need to memorize the sort order, but it is important to be aware of it.
```elixir
number < atom < reference < function < port < pid < tuple < map < list < bistring
```
This can lead to some interesting, yet valid comparisons you may not find in other languages.
```elixir
:hello > 999  # true
{:hello, :world} > [1, 2, 3]  # false
```
### String Interpolation
If you've used Ruby, string interpolation in Elixir will look familiar.
```elixir
name = "Sean"
"Hello #{name}" # Hello Sean
```
### String Concatenation
String concatenation uses the `<>` operator.
```elixir
name = "Sean"
"Hello " <> name # Hello Sean
```