defmodule Surface.Components.Catalogue do
  use Surface.Catalogue

  load_asset "assets/bulma.min.css", as: :bulma_css

  @impl true
  def config() do
    [
      head_css: """
      <style>#{@bulma_css}</style>
      """,
      # Using catalogue JS because surface_form_helpers doesn't have any custom JS
      # or Hooks. Needs to change if surface_form_helpers starts having javascript.
      head_js: """
      <script defer type="module" src="/assets/catalogue/app.js"></script>
      """
    ]
  end
end
