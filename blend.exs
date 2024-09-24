%{
  local: [
    {:surface, path: "../surface", override: true},
    {:surface_catalogue, only: :dev, path: "../surface_catalogue"}
  ],
  github: [
    {:surface, github: "surface-ui/surface", override: true},
    {:surface_catalogue, only: :dev, github: "surface-ui/surface_catalogue"}
  ],
  phoenix_html_0_4_0: [
    {:phoenix_html, "4.0.0"}
  ]
}
