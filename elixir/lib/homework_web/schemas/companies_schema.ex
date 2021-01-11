defmodule HomeworkWeb.Schemas.CompaniesSchema do
  @moduledoc """
  Defines the graphql schema for company.
  """
  use Absinthe.Schema.Notation

  alias HomeworkWeb.Resolvers.CompaniesResolver

  object :company do
    field(:id, non_null(:id))
    field(:name, :string)
    field(:credit_line, :integer)
    field(:available_credit, :integer)
    field(:inserted_at, :naive_datetime)
    field(:updated_at, :naive_datetime)
  end

  object :companies_mutations do
    @desc "Create a new company"
    field :create_company, :company do
      arg(:name, non_null(:id))
      arg(:credit_line, non_null(:integer))

      resolve(&CompaniesResolver.create_company/3)
    end

  #   @desc "Update a new user"
  #   field :update_user, :user do
  #     arg(:id, non_null(:id))
  #     arg(:company_id, non_null(:id))
  #     arg(:dob, non_null(:string))
  #     arg(:first_name, non_null(:string))
  #     arg(:last_name, non_null(:string))

  #     resolve(&UsersResolver.update_user/3)
  #   end

  #   @desc "delete an existing user"
  #   field :delete_user, :user do
  #     arg(:id, non_null(:id))

  #     resolve(&UsersResolver.delete_user/3)
  #   end

  #   @desc "fuzzy search for a user by first and last name"
  #   field :search_user, list_of(:user) do
  #     arg(:first_name, non_null(:string))
  #     arg(:last_name, non_null(:string))

  #     resolve(&UsersResolver.search_user/3)
  #   end
  end
end
