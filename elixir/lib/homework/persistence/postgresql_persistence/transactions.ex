defmodule Homework.PostgresqlPersistence.Transactions do
  @behaviour Homework.Persistence.Transactions

  @moduledoc """
  The Transactions context.
  """

  import Ecto.Query, warn: false
  alias Homework.Repo

  alias Homework.Transactions.Transaction

  @doc """
  Returns the list of transactions.

  ## Examples

      iex> list_transactions([])
      [%Transaction{}, ...]

  """
  def list_transactions() do
    Repo.all(Transaction)
  end

  @doc """
  Gets a single transaction.

  Raises `Ecto.NoResultsError` if the Transaction does not exist.

  ## Examples

      iex> get_transaction!(123)
      %Transaction{}

      iex> get_transaction!(456)
      ** (Ecto.NoResultsError)

  """
  def get_transaction!(id), do: Repo.get!(Transaction, id)

  @doc """
  Creates a transaction.

  ## Examples

      iex> create_transaction(%{field: value})
      {:ok, %Transaction{}}

      iex> create_transaction(%{field: bad_value})
      {:error, %Ecto.Changeset{}}

  """
  def create_transaction(attrs \\ %{}) do
    %Transaction{}
    |> Transaction.changeset(attrs)
    |> Repo.insert()
  end

  @doc """
  Updates a transaction.

  ## Examples

      iex> update_transaction(transaction, %{field: new_value})
      {:ok, %Transaction{}}

      iex> update_transaction(transaction, %{field: bad_value})
      {:error, %Ecto.Changeset{}}

  """
  def update_transaction(%Transaction{} = transaction, attrs) do
    transaction
    |> Transaction.changeset(attrs)
    |> Repo.update()
  end

  @doc """
  Deletes a transaction.

  ## Examples

      iex> delete_transaction(transaction)
      {:ok, %Transaction{}}

      iex> delete_transaction(transaction)
      {:error, %Ecto.Changeset{}}

  """
  def delete_transaction(%Transaction{} = transaction) do
    Repo.delete(transaction)
  end

  @doc """
  Search for a transaction amount by a given min and max.

  ## Examples

      iex> search_transaction(transaction)
      {:ok, %Transaction{}}

      iex> search_transaction(transaction)
      {:error, %Ecto.Changeset{}}

  """
  def search_transaction(min, max) do 
    query = from t in Transaction, 
      where: (t.amount >= ^min and t.amount <= ^max)
    Repo.all(query)
  end

  # @doc """
  # Pageinate through all users ordered by the transaction id asc given the limit and skip values.
  # Returns the results and the total number of results.
  # """
  # def pageinate(limit, skip) do
  #   query = from t in Transaction, 
  #     select: t,
  #     order_by: [asc: t.id],
  #     limit: ^limit,
  #     offset: ^skip
  #   results = Repo.all(query)
  #   %{results: results, total_rows: length(results)}
  # end

  # @doc """
  # Returns an `%Ecto.Changeset{}` for tracking transaction changes.

  # ## Examples

  #     iex> change_transaction(transaction)
  #     %Ecto.Changeset{data: %Transaction{}}

  # """
  # def change_transaction(%Transaction{} = transaction, attrs \\ %{}) do
  #   Transaction.changeset(transaction, attrs)
  # end
end
