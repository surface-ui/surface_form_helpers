# Surface.Form

Surface wrappers for legacy `Phoenix.HTML.Form` functions.

> [!NOTE]
> This library is maintained only for compatibility and does not accept new features.
> We strongly recommend using the new built-in [<.form>](https://hexdocs.pm/phoenix_live_view/Phoenix.Component.html#form/)
> component, along with [Phoenix.HTML.Form](https://hexdocs.pm/phoenix_html/Phoenix.HTML.Form.html) and
> [Phoenix.HTML.FormField](https://hexdocs.pm/phoenix_html/Phoenix.HTML.FormField.html) structs. If you're
> not able to update all your forms at once, then this library can be used as a safe fallback so you can
> gradually replace them.

## Installation

Add `surface_form_helpers` to the list of dependencies in `mix.exs`:

```elixir
def deps do
  [
    {:surface_form_helpers, "~> 0.2.0"}
  ]
end
```

## License

Copyright (c) 2024, Marlus Saraiva.

Surface source code is licensed under the [MIT License](LICENSE.md).
