defmodule Homework.Merchants do
  @moduledoc """
  The Merchants context.
  """

  import Ecto.Query, warn: false
  alias Homework.Repo

  alias Homework.Merchants.Merchant

  @doc """
  Returns the list of merchants.

  ## Examples

      iex> list_merchants([])
      [%Merchant{}, ...]

  """
  def list_merchants(_args) do
    Repo.all(Merchant)
  end

  @doc """
  Gets a single merchant.

  Raises `Ecto.NoResultsError` if the Merchant does not exist.

  ## Examples

      iex> get_merchant!(123)
      %Merchant{}

      iex> get_merchant!(456)
      ** (Ecto.NoResultsError)

  """
  def get_merchant!(id), do: Repo.get!(Merchant, id)

  @doc """
  Gets a single merchant by name.

  Raises `Ecto.NoResultsError` if the Merchant does not exist.

  ## Examples

      iex> get_merchant_by_last_name!(123)
      %Merchant{}

      iex> get_merchant_by_last_name!(456)
      ** (Ecto.NoResultsError)

  """
  def get_merchant_by_name!(name) do 
    query = from(
      m in Merchant, 
      where: m.name == ^name
    )
    Repo.one(query)
  end

  @doc """
  Creates a merchant.

  ## Examples

      iex> create_merchant(%{field: value})
      {:ok, %Merchant{}}

      iex> create_merchant(%{field: bad_value})
      {:error, %Ecto.Changeset{}}

  """
  def create_merchant(attrs \\ %{}) do
    %Merchant{}
    |> Merchant.changeset(attrs)
    |> Repo.insert()
  end

  @doc """
  Updates a merchant.

  ## Examples

      iex> update_merchant(merchant, %{field: new_value})
      {:ok, %Merchant{}}

      iex> update_merchant(merchant, %{field: bad_value})
      {:error, %Ecto.Changeset{}}

  """
  def update_merchant(%Merchant{} = merchant, attrs) do
    merchant
    |> Merchant.changeset(attrs)
    |> Repo.update()
  end

  @doc """
  Deletes a merchant.

  ## Examples

      iex> delete_merchant(merchant)
      {:ok, %Merchant{}}

      iex> delete_merchant(merchant)
      {:error, %Ecto.Changeset{}}

  """
  def delete_merchant(%Merchant{} = merchant) do
    Repo.delete(merchant)
  end

  @doc """
  Fuzzy search a merchant by name.

  ## Examples

      iex> search_merchant(merchant_name)
      {:ok, %Merchant{}}

      iex> search_merchant(merchant)
      {:error, %Ecto.Changeset{}}

  """
  def search_merchant(name) do 
    query = from m in Merchant, 
      where: ilike(m.name, ^"%#{name}%")
    Repo.all(query)
  end

  @doc """
  Pageinate through all users ordered by the merchant name asc given the limit and skip values.
  Returns the results and the total number of results.
  """
  def pageinate(limit, skip) do
    query = from m in Merchant, 
      select: m,
      order_by: [asc: m.name],
      limit: ^limit,
      offset: ^skip
    results = Repo.all(query)
    %{results: results, total_rows: length(results)}
  end

  @doc """
  Returns an `%Ecto.Changeset{}` for tracking merchant changes.

  ## Examples

      iex> change_merchant(merchant)
      %Ecto.Changeset{data: %Merchant{}}

  """
  def change_merchant(%Merchant{} = merchant, attrs \\ %{}) do
    Merchant.changeset(merchant, attrs)
  end
end
