defmodule Demo do
  use Lua.API, scope: "demo"

  deflua(my_name, do: "an Elixir Lua demo")

  def greet(script, name) do
    Lua.new() |> Lua.load_api(__MODULE__) |> Lua.set!([:name], name) |> Lua.eval!(script)
  end
end
