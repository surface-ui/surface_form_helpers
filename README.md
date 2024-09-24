# Surface.Form

Surface Wrappers for `Phoenix.HTML.Form` functions.

> [!NOTE]
> This library is maintained only for compatibility and does not accept new features.
> We strongly recommend using the new built-in [<.form>](https://hexdocs.pm/phoenix_live_view/Phoenix.Component.html#form/)
> component, along with [Phoenix.HTML.Form](https://hexdocs.pm/phoenix_html/Phoenix.HTML.Form.html) and
> [Phoenix.HTML.FormField](https://hexdocs.pm/phoenix_html/Phoenix.HTML.FormField.html) structs. If you're
> not able to update all your forms at once, then this library can be used as a safe fallback so you can
> gradually replace them.

## Installation

If [available in Hex](https://hex.pm/docs/publish), the package can be installed
by adding `surface_form` to your list of dependencies in `mix.exs`:

```elixir
def deps do
  [
    {:surface_form, "~> 0.1.0"}
  ]
end
```

Documentation can be generated with [ExDoc](https://github.com/elixir-lang/ex_doc)
and published on [HexDocs](https://hexdocs.pm). Once published, the docs can
be found at <https://hexdocs.pm/surface_form>.
