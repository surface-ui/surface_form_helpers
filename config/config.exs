import Config

if Mix.env() == :dev do
  config :surface_catalogue,
    title: "Surface Form",
    subtitle: ""

  config :esbuild,
    version: "0.17.11",
    catalogue: [
      args:
        ~w(#{Mix.Project.deps_paths().surface_catalogue}/assets/js/app.js --bundle --target=es2016 --minify --outdir=priv/static/assets/catalogue),
      env: %{"NODE_PATH" => Path.expand("../deps", __DIR__)}
    ]

  # Required at compile time
  config :surface_catalogue, Surface.Catalogue.Server.Endpoint,
    code_reloader: true,
    debug_errors: true
end
