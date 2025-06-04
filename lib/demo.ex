defmodule Demo do
  @moduledoc false
  use Lua.API

  deflua my_name, do: "an Elixir Lua demo"

  deflua regex(string), lua do
    Lua.encode!(lua, {:userdata, Regex.compile!(string)})
  end

  deflua get_matches(string, encoded_regex), lua do
    {:userdata, regex} = Lua.decode!(lua, encoded_regex)
    regex |> Regex.scan(string, capture: :all_but_first) |> List.flatten()
  end

  def greet(script, name) do
    {result, _lua} =
      Lua.new() |> Lua.load_api(__MODULE__) |> Lua.set!([:name], name) |> Lua.eval!(script)

    result
  end

  def scan(script, input) do
    lua = Lua.new()

    {results, _lua} =
      lua
      |> Lua.load_api(__MODULE__)
      |> Lua.set!([:input], input)
      |> Lua.eval!(script)

    results
  end
end
