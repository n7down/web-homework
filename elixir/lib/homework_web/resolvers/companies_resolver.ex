defmodule HomeworkWeb.Resolvers.CompaniesResolver do
  alias Homework.Persistence
  alias Homework.PostgresqlPersistence

  @doc """ 
  Get a list of companies
  """
  def companies(_root, _args, _info) do
    {:ok, Persistence.Companies.list_companies!(PostgresqlPersistence.Companies)}
  end

  @doc """
  Creates a company
  """
  def create_company(_root, args, _info) do
    case Persistence.Companies.create_company!(PostgresqlPersistence.Companies, args) do
      {:ok, company} ->
        {:ok, company}

      error ->
        {:error, "could not create company: #{inspect(error)}"}
    end
  end

  @doc """
  Updates a user for an id with args specified.
  """
  def update_company(_root, %{id: id} = args, _info) do
    company = Persistence.Companies.get_company!(PostgresqlPersistence.Companies, id)

    case Persistence.Companies.update_company!(PostgresqlPersistence.Companies, company, args) do
      {:ok, company} ->
        {:ok, company}

      error ->
        {:error, "could not update user: #{inspect(error)}"}
    end
  end

  @doc """
  Deletes a user for an id
  """
  def delete_company(_root, %{id: id}, _info) do
    company = Persistence.Companies.get_company!(PostgresqlPersistence.Companies, id)

    case Persistence.Companies.delete_company!(PostgresqlPersistence.Companies, company) do
      {:ok, company} ->
        {:ok, company}

      error ->
        {:error, "could not update user: #{inspect(error)}"}
    end
  end
end


