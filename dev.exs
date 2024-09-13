# iex -S mix dev

Logger.configure(level: :debug)

# Start the catalogue server
Surface.Catalogue.Server.start(
  watchers: [
    esbuild: {Esbuild, :install_and_run, [:catalogue, ~w(--sourcemap=inline --watch)]}
  ],
  live_reload: [
    patterns: [
      ~r"priv/static/.*(js|css)$",
      ~r"lib/surface/.*(ex)$"
    ],
    notify: [
      live_view: [
        ~r"lib/surface/.*(sface|css)$"
      ]
    ]
  ]
)
