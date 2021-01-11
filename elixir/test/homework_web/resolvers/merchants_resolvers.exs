defmodule HomeworkWeb.MerchantsResolversTest do
  use ExUnit.Case, async: false

  alias HomeworkWeb.Resolvers.MerchantsResolver

  describe "create merchant" do
    test "creates a new merchant with valid attributes through resolver" do
      variables = %{"name" => "a merchants name", "description" => "a description"}
      result = HomeworkWeb.Resolvers.MerchantsResolver.create_merchant(nil, variables, %{})
      assert {:ok,  %Homework.Merchants.Merchant{name: "a merchants name", description: "a description"}} = result
    end
  end
end

