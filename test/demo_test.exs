defmodule DemoTest do
  use ExUnit.Case

  doctest Demo

  describe "Demo" do
    test "Executes some lua code, exposing avariable and allowing it to call back to an Elixir function" do
      script = ~S"""
      return "Hello, " .. name .. "! I’m " .. my_name() .. "."
      """

      assert ["Hello, Kerry! I’m an Elixir Lua demo."] = Demo.greet(script, "Kerry")
    end

    test "allows lua code to use real regular expressions" do
      script = ~S"""
      return get_matches(input, regex("(\\d+)"))
      """

      assert ["42", "123"] = Demo.scan(script, "Foo 42 bar 123 baz")
    end
  end
end
