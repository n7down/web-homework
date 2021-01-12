defmodule HomeworkWeb.Resolvers.TransactionsResolver do
  alias Homework.Persistence
  alias Homework.PostgresqlPersistence

  @doc """
  Get a list of transcations
  """
  def transactions(_root, _args, _info) do
   {:ok, Persistence.Transactions.list_transactions!(PostgresqlPersistence.Transactions)}
  end

  @doc """
  Get the user associated with a transaction
  """
  def user(_root, _args, %{source: %{user_id: user_id}}) do
    {:ok, Persistence.Users.get_user!(PostgresqlPersistence.Transactions, user_id)}
  end

  @doc """
  Get the merchant associated with a transaction
  """
  def merchant(_root, _args, %{source: %{merchant_id: merchant_id}}) do
    {:ok, Persistence.Merchants.get_merchant!(PostgresqlPersistence.Merchants, merchant_id)}
  end

  @doc """
  Create a new transaction
  """
  def create_transaction(_root, args, _info) do
    case Persistence.Transactions.create_transaction!(PostgresqlPersistence.Transactions, args) do
      {:ok, transaction} ->
        {:ok, transaction}

      error ->
        {:error, "could not create transaction: #{inspect(error)}"}
    end
  end

  @doc """
  Updates a transaction for an id with args specified.
  """
  def update_transaction(_root, %{id: id} = args, _info) do
    transaction = Persistence.Transactions.get_transaction!(PostgresqlPersistence.Transactions, id)

    case Persistence.Transactions.update_transaction!(PostgresqlPersistence.Transactions, transaction, args) do
      {:ok, transaction} ->
        {:ok, transaction}

      error ->
        {:error, "could not update transaction: #{inspect(error)}"}
    end
  end

  @doc """
  Deletes a transaction for an id
  """
  def delete_transaction(_root, %{id: id}, _info) do
    transaction = Persistence.Transactions.get_transaction!(PostgresqlPersistence.Transactions, id)

    case Persistence.Transactions.delete_transaction!(PostgresqlPersistence.Transactions, transaction) do
      {:ok, transaction} ->
        {:ok, transaction}

      error ->
        {:error, "could not delete transaction: #{inspect(error)}"}
    end
  end
  
  @doc """
  Search for a transaction amount for an given min and max specified.
  """
  def search_transaction(_root, %{min: min, max: max}, _info) do
    case Persistence.Transactions.search_transaction!(PostgresqlPersistence.Transactions, min, max) do
      [] -> {:error, "could not find the transaction"}
      transaction -> {:ok, transaction}
    end
  end
end
