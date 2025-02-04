defmodule ReactSurface.MixProject do
  use Mix.Project

  def project do
    [
      app: :react_surface,
      version: "0.5.1",
      elixir: "~> 1.11",
      elixirc_paths: elixirc_paths(Mix.env()),
      package: package(),
      compilers: [:phoenix] ++ Mix.compilers(),
      description: description(),
      start_permanent: Mix.env() == :prod,
      aliases: aliases(),
      deps: deps()
    ]
  end

  # Run "mix help compile.app" to learn about applications.
  def application do
    [
      extra_applications: [:logger]
    ]
  end

  defp elixirc_paths(:test), do: ["lib", "test/support"]
  defp elixirc_paths(_), do: ["lib"]

  # Run "mix help deps" to learn about dependencies.
  defp deps do
    [
      {:jason, "~> 1.1"},
      {:surface, "~> 0.5"},
      {:node_ssr, github: "harmon25/node_ssr", branch: "main", runtime: false},
      {:floki, ">= 0.27.0", only: :test},
      {:erlexec, "~> 1.18", override: true}
    ]
  end

  def description do
    """
    A helper library for rendering React components via [Surface](http://surface-demo.msaraiva.io/)
    """
  end

  defp aliases do
    [test: "test test/react_surface_test.exs"]
  end

  defp package do
    [
      name: :react_surface,
      files: ["lib", "priv", "mix.exs", "package.json", "README*", "LICENSE*"],
      maintainers: ["Doug W."],
      licenses: ["MIT"],
      links: %{"GitHub" => "https://github.com/harmon25/react_surface"}
    ]
  end
end
