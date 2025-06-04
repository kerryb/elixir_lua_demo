defmodule DemoTest do
  use ExUnit.Case
  doctest Demo

  describe "Demo" do
    test "Executes some lua code, exposing avariable and allowing it to call back to an Elixir function" do
      script = """
      return "Hello, " .. name .. "! I’m " .. demo.my_name() .. "."
      """

      {[result], _state} = Demo.greet(script, "Kerry")
      assert result == "Hello, Kerry! I’m an Elixir Lua demo."
    end
  end
end
