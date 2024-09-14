# Used by "mix format"
[
  import_deps: [:phoenix, :surface],
  plugins: [
    Phoenix.LiveView.HTMLFormatter,
    Surface.Formatter.Plugin
  ],
  line_length: 115,
  inputs: [
    "{mix,.formatter}.exs",
    "{config,lib,test}/**/*.{ex,exs}",
    "blend.exs",
    "blend/*.exs",
    "priv/catalogue/**/*.{ex,exs,sface}"
  ]
]
