defmodule Homework.UsersMutationsTest do
  # use ExUnit.Case, async: false
  use HomeworkWeb.ConnCase, async: true

  alias Homework.Companies

  describe "create user" do
    test "creates a new user with valid attributes running the schema" do 
      mutation = """
      mutation createUser($first_name: String, $last_name: String, $dob: String, $company_id: ID) {
        createUser(first_name: $first_name, last_name: $last_name, dob: $dob, company_id: $company_id) {
          firstName
          lastName
          dob
        }
      }
      """

      company = Homework.Companies.get_company_by_name!("parks and recreation")
      # IO.inspect(company)
      # variables = %{"first_name" => "craig", "last_name" => "middlebrooks", "dob" => "09181978", "company_id" => company.id}
      variables = %{first_name: "craig", last_name: "middlebrooks", dob: "09181978", company_id: company.id}
      response = build_conn() |> post("/graphiql", %{query: mutation, variables: variables}) 
      assert json_response(response, 200) == %{
        "data" => %{"createUser" => %{"dob" => "09181978", "first_name" => "craig", "last_name" => "middlebrooks"}}
      }
    end
  end
end
