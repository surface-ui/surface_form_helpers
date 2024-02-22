defmodule Surface.Form.MixProject do
  use Mix.Project

  @version "0.1.0"
  @source_url "https://github.com/surface-ui/surface_form"

  def project do
    [
      app: :surface_form,
      version: @version,
      elixir: "~> 1.13",
      description: "Wrappers for Phoenix.HTML.Form functions",
      start_permanent: Mix.env() == :prod,
      elixirc_paths: elixirc_paths(Mix.env()),
      aliases: aliases(),
      deps: deps(),
      preferred_cli_env: [docs: :docs],
      # Docs
      name: "Surface Form",
      source_url: @source_url,
      homepage_url: "https://surface-ui.org",
      docs: docs(),
      package: package()
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
      {:ecto, "~> 3.9.5 or ~> 3.9", only: :test},
      {:ex_doc, ">= 0.31.1", only: :docs, runtime: false}
    ]
  end

  defp docs do
    [
      main: "readme",
      source_ref: "v#{@version}",
      nest_modules_by_prefix: [
        Surface.Components,
        Surface.Components.Form
      ],
      extras: [
        "README.md",
        "LICENSE.md"
      ]
    ]
  end

  defp package do
    %{
      licenses: ["MIT"],
      links: %{"GitHub" => @source_url}
    }
  end
end
