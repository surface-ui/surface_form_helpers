defmodule Surface.Form.MixProject do
  use Mix.Project

  def project do
    [
      app: :surface_form,
      version: "0.1.0",
      elixir: "~> 1.13",
      start_permanent: Mix.env() == :prod,
      elixirc_paths: elixirc_paths(Mix.env()),
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

  defp elixirc_paths(:dev), do: ["lib"] ++ catalogues()
  defp elixirc_paths(:test), do: ["lib", "test/support"] ++ catalogues()
  defp elixirc_paths(_), do: ["lib"]

  def catalogues do
    ["priv/catalogue"]
  end

  defp aliases do
    [
      dev: "run --no-halt dev.exs"
    ]
  end

  # Run "mix help deps" to learn about dependencies.
  defp deps do
    [
      {:surface, "~> 0.12-dev", github: "surface-ui/surface", override: true},
      {:phoenix_html, "~> 3.3.1"},
      {:surface_catalogue, only: :dev, github: "surface-ui/surface_catalogue"},
      {:esbuild, "~> 0.2", only: :dev},
      {:plug_cowboy, "~> 2.0", only: :dev},
      {:phoenix_live_reload, "~> 1.2", only: :dev},
      {:jason, "~> 1.0", only: [:dev, :test]},
      {:floki, "~> 0.35", only: :test},
      {:phoenix_ecto, "~> 4.3", only: :test},
      {:ecto, "~> 3.9.5 or ~> 3.9", only: :test}
    ]
  end
end
