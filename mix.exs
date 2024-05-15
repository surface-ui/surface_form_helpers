defmodule Surface.Form.MixProject do
  use Mix.Project

  def project do
    [
      app: :surface_form,
      version: "0.1.0",
      elixir: "~> 1.13",
      start_permanent: Mix.env() == :prod,
      elixirc_paths: elixirc_paths(Mix.env()),
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

  defp catalogues do
    ["priv/catalogue"]
  end

  # Run "mix help deps" to learn about dependencies.
  defp deps do
    [
      {:surface, github: "surface-ui/surface", ref: "main"},
      {:phoenix_html, "~> 4.1"},
      {:phoenix_html_helpers, "~> 1.0"},
      {:jason, "~> 1.0", only: :test},
      {:floki, "~> 0.35", only: :test},
      {:phoenix_ecto, "~> 4.3", only: :test},
      {:ecto, "~> 3.9.5 or ~> 3.9", only: :test}
    ]
  end
end
