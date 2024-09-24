if File.exists?("blend/premix.exs") do
  Code.compile_file("blend/premix.exs")
else
  defmodule Blend.Premix.SurfaceForm do
    def patch_project(project), do: project
    def patch_deps(deps), do: deps
  end
end

defmodule Surface.Form.MixProject do
  use Mix.Project

  @version "0.2.0"
  @source_url "https://github.com/surface-ui/surface_form_helpers"
  @homepage_url "https://surface-ui.org"

  def project do
    [
      app: :surface_form_helpers,
      version: @version,
      elixir: "~> 1.13",
      description: "Surface wrappers for Phoenix.HTML.Form functions",
      start_permanent: Mix.env() == :prod,
      elixirc_paths: elixirc_paths(Mix.env()),
      compilers: Mix.compilers() ++ [:surface],
      aliases: aliases(),
      deps: deps(),
      preferred_cli_env: [docs: :docs],
      # Docs
      name: "Surface Form",
      source_url: @source_url,
      homepage_url: @homepage_url,
      docs: docs(),
      package: package()
    ]
    |> Blend.Premix.SurfaceForm.patch_project()
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
      {:surface, "~> 0.12.0"},
      {:phoenix_html, "~> 4.0"},
      {:phoenix_html_helpers, "~> 1.0"},
      {:surface_catalogue, "~> 0.6.3", only: :dev},
      {:esbuild, "~> 0.2", only: :dev},
      {:plug_cowboy, "~> 2.0", only: :dev},
      {:phoenix_live_reload, "~> 1.2", only: :dev},
      {:jason, "~> 1.0", only: [:dev, :test]},
      {:blend, "~> 0.4.0", only: :dev},
      {:floki, "~> 0.35", only: :test},
      {:phoenix_ecto, "~> 4.3", only: :test},
      {:ecto, "~> 3.9.5 or ~> 3.9", only: :test},
      {:ex_doc, ">= 0.31.1", only: :docs, runtime: false}
    ]
    |> Blend.Premix.SurfaceForm.patch_deps()
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
        "CHANGELOG.md",
        "LICENSE.md"
      ]
    ]
  end

  defp package do
    %{
      licenses: ["MIT"],
      links: %{
        Website: @homepage_url,
        Changelog: "https://hexdocs.pm/surface_form_helpers/changelog.html",
        GitHub: @source_url
      },
      files: ~w(
          README.md
          CHANGELOG.md
          LICENSE.md
          mix.exs
          lib
          priv/catalogue
        )
    }
  end
end
