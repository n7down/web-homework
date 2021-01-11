defmodule HomeworkWeb.MerchantsMutationsTest do
  use HomeworkWeb.ConnCase, async: true

  describe "create merchant" do
    test "creates a new merchant with valid attributes running the schema" do 
      mutation = """
      mutation createMerchant($name: String, $description: String) {
        createMerchant(name: $name, description: $description) {
          name
          description
        }
      }
      """

      variables = %{"name" => "a merchant name", "description" => "a description"}
      response = build_conn() |> post("/graphiql", %{query: mutation, variables: variables}) 
      assert json_response(response, 200) == %{
        "data" => %{"createMerchant" => %{"description" => "a description", "name" => "a merchant name"}}
      }
    end
  end
end
