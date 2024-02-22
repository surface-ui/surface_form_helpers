defmodule Surface.Components.ContextTest do
  use Surface.ConnCase, async: true

  defmodule InputsWithNestedField do
    use Surface.Component

    alias Surface.Components.Form.{Inputs, Field, TextInput}

    def render(assigns) do
      ~F"""
      <Inputs for={:children}>
        <Field name={:name}>
          <TextInput/>
        </Field>
      </Inputs>
      """
    end
  end

  describe "in components" do
    test "using form and field stored in the context" do
      alias Surface.Components.Form

      html =
        render_surface do
          ~F"""
          <Form for={%{}} as={:parent} opts={csrf_token: "test"}>
            <InputsWithNestedField/>
          </Form>
          """
        end

      assert html =~ """
             <form action="#" method="post">
                 <input name="_csrf_token" type="hidden" hidden value="test">
                   <input type="hidden" name="parent[children][_persistent_id]" value="0">
               <div>
                 <input id="parent_children_0_name" name="parent[children][name]" type="text">
             </div>
             </form>
             """
    end
  end
end
