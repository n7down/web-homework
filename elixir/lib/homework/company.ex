defmodule Homework.Companies do
  @moduledoc """
  The Companies context.
  """

  import Ecto.Query, warn: false
  alias Homework.Repo

  alias Homework.Companies.Company
  alias Homework.Transactions.Transaction

  @doc """
  Returns the list of companies.

  ## Examples

      iex> list_companies([])
      [%Company{}, ...]

  """
  def list_company(_args) do
    child_query = from t in Transaction, 
      select: %{total_amount: sum(t.amount), company_id: t.company_id},
      group_by: t.company_id
    query = from c in Company,
      left_join: t in subquery(child_query), on: t.company_id == c.id,
      select: %{
        id: c.id,
        name: c.name, 
        credit_line: c.credit_line, 
        available_credit: fragment("? - coalesce(?,0) as available_credit", c.credit_line, t.total_amount)
      }
    Repo.all(query)
  end

  @doc """
  Gets a single company.

  Raises `Ecto.NoResultsError` if the Company does not exist.

  ## Examples

      iex> get_company!(123)
      %Company{}

      iex> get_company!(456)
      ** (Ecto.NoResultsError)

  """
  def get_company!(id), do: Repo.get!(Company, id)

  @doc """
  Gets a single company by name.

  Raises `Ecto.NoResultsError` if the User does not exist.

  ## Examples

      iex> get_company_by_name!(123)
      %User{}

      iex> get_company_by_name!(456)
      ** (Ecto.NoResultsError)

  """
  def get_company_by_name!(name) do 
    query = from(
      c in Company, 
      where: c.name == ^name
    )
    Repo.one(query)
  end

  @doc """
  Creates a company.

  ## Examples

      iex> create_company(%{field: value})
      {:ok, %Company{}}

      iex> create_company(%{field: bad_value})
      {:error, %Ecto.Changeset{}}

  """
  def create_company(attrs \\ %{}) do
    %Company{}
    |> Company.changeset(attrs)
    |> Repo.insert()
  end

  @doc """
  Updates a company.

  ## Examples

      iex> update_company(company, %{field: new_value})
      {:ok, %Company{}}

      iex> update_company(company, %{field: bad_value})
      {:error, %Ecto.Changeset{}}

  """
  def update_company(%Company{} = company, attrs) do
    company
    |> Company.changeset(attrs)
    |> Repo.update()
  end

  @doc """
  Deletes a company.

  ## Examples

      iex> delete_company(company)
      {:ok, %Company{}}

      iex> delete_company(company)
      {:error, %Ecto.Changeset{}}

  """
  def delete_company(%Company{} = company) do
    Repo.delete(company)
  end

  @doc """
  Search for a company by name.

  ## Examples

      iex> search_company(company)
      {:ok, %Company{}}

      iex> search_company(company)
      {:error, %Ecto.Changeset{}}

  """
  def search_company(name) do 
    query = from c in Company, 
      where: ilike(c.name, ^"%#{name}%")
    Repo.all(query)
  end

  @doc """
  Pageinate through all company ordered by name asc given the limit and skip values.
  Returns the results and the total number of results.
  """
  def pageinate(limit, skip) do
    query = from c in Company, 
      select: c,
      order_by: [asc: c.name],
      limit: ^limit,
      offset: ^skip
    results = Repo.all(query)
    %{results: results, total_rows: length(results)}
  end

  @doc """
  Returns an `%Ecto.Changeset{}` for tracking company changes.

  ## Examples

      iex> change_company(company)
      %Ecto.Changeset{data: %Company{}}

  """
  def change_company(%Company{} = company, attrs \\ %{}) do
    Company.changeset(company, attrs)
  end
end
