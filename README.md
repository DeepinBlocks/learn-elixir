# learn-elixir
## Basics
### Basic Data Types
#### Integers
Support for binary, octal, and hexadecimal number comes built in.
```elixir
0o644 // 420
420
0x1F // 31
```
#### Floats
In elixir, floating point numbers require a decimal after at least one digit; they have 64-bit double precision and support `e` for exponent values.
```elixir
1.0e-1 + 3.14e-2
```
#### Booleans
Elixir supports `true` and `false` as booleans; everything is truthy except for `false` and `nil`.
#### Atoms
An atom is a constant whose name is its value. If you're familiar with Ruby, these are synonymous with Symbols.
```elixir
:foo = :bar // false
```
The booleans `true` and `false` ara also the atoms `:true` and `:false`, respectively.
```elixir
is_atom(true)    // true
is_boolean(true) // true
:true === :true  // true
```
Names of modules in Elixir are also atoms. `MyApp.MyModule` is a valid atom, even if no such module has been declared yet.
```elixir
is_atom(MyApp.MyModule)
```
Atoms are also used to reference modules from Erlang libraries, including built in ones.
```elixir
:crypto.strong_rand_bytes(3)
```
#### Strings
Strings in Elixir are UTF-8 encoded and are wrapped in double quotes.
Strings support line breaks and escape sequences.
```elixir
"foo
bar"
"foo\nbar"
```
