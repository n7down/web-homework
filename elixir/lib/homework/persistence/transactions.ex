defmodule Homework.Persistence.Transactions do

  alias Homework.Transactions.Transaction

  @callback list_transactions() :: list(%Transaction{}) | Ecto.NoResultsError
  @callback get_transaction!(charlist()) :: %Transaction{} | Ecto.NoResultsError
  @callback create_transaction(map()) :: {:ok, %Transaction{}} | {:error, %Ecto.Changeset{}}
  @callback update_transaction(%Transaction{}, map()) :: {:ok, %Transaction{}} | {:error, %Ecto.Changeset{}}
  @callback delete_transaction(%Transaction{}) :: {:ok, %Transaction{}} | {:error, %Ecto.Changeset{}}
  @callback search_transaction(:integer, :integer) :: %Transaction{} | %Ecto.NoResultsError{}
  # @callback pageinate(:integer, :integer) :: list(%User{}) | %Ecto.NoResultsError{}
  # @callback change_user(%User{} = user, attrs \\ %{}) :: %Ecto.Changeset{}
  
  def list_transactions!(impl) do
    case impl.list_transactions() do
      :error -> :error
      transaction -> transaction 
    end
  end

  def create_transaction!(impl, args) do
    case impl.create_transaction(args) do
      {:ok, transaction} -> {:ok, transaction}
      {:error, %Ecto.Changeset{}} -> {:error, %Ecto.Changeset{}}
    end
  end

  def get_transaction!(impl, id) do
    case impl.get_transaction!(id) do
      :error -> :error
      transaction -> transaction 
    end
  end

  def update_transaction!(impl, transaction, args) do
    case impl.update_transaction(transaction, args) do
      {:ok, transaction} -> {:ok, transaction}
      {:error, %Ecto.Changeset{}} -> {:error, %Ecto.Changeset{}}
    end
  end

  def delete_transaction!(impl, transaction) do
    case impl.delete_transaction(transaction) do
      {:ok, transaction} -> {:ok, transaction}
      {:error, %Ecto.Changeset{}} -> {:error, %Ecto.Changeset{}}
    end
  end

  def search_transaction!(impl, min, max) do
    case impl.search_transaction(min, max) do
      :error -> :error
      transaction -> transaction
    end
  end
end
