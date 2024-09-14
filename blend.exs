%{
  local: [
    {:surface, path: "../surface", override: true},
    {:surface_catalogue, only: :dev, path: "../surface_catalogue"}
  ],
  github: [
    {:surface, github: "surface-ui/surface", override: true},
    {:surface_catalogue, only: :dev, github: "surface-ui/surface_catalogue"}
  ],
  phoenix_live_view_0_19_0: [
    {:phoenix_live_view, "0.19.0"}
  ]
}
