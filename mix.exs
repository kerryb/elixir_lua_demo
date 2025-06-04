defmodule Demo.MixProject do
  use Mix.Project

  def project do
    [
      app: :elixir_lua_demo,
      version: "0.1.0",
      elixir: "~> 1.18",
      start_permanent: Mix.env() == :prod,
      deps: deps()
    ]
  end

  def application do
    [
      extra_applications: [:logger]
    ]
  end

  defp deps do
    [
      {:lua, "~> 0.2"},
      {:styler, "~> 1.4", only: [:dev, :test], runtime: false}
    ]
  end
end
