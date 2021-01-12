defmodule HomeworkWeb.Resolvers.MerchantsResolver do
  alias Homework.Persistence
  alias Homework.PostgresqlPersistence

  @doc """
  Get a list of merchants
  """
  def merchants(_root, _args, _info) do
    # {:ok, Merchants.list_merchants(args)}
    {:ok, Persistence.Merchants.list_merchants!(PostgresqlPersistence.Merchants)}
  end

  @doc """
  Create a new merchant
  """
  def create_merchant(_root, args, _info) do
    # case Merchants.create_merchant(args) do
    case Persistence.Merchants.create_merchant!(PostgresqlPersistence.Merchants, args) do
      {:ok, merchant} ->
        {:ok, merchant}

      error ->
        {:error, "could not create merchant: #{inspect(error)}"}
    end
  end

  @doc """
  Updates a merchant for an id with args specified.
  """
  def update_merchant(_root, %{id: id} = args, _info) do
    # merchant = Merchants.get_merchant!(id)
    merchant = Persistence.Merchants.get_merchant!(PostgresqlPersistence.Merchants, id)

    # case Merchants.update_merchant(merchant, args) do
    case Persistence.Merchants.update_merchant!(PostgresqlPersistence.Merchants, merchant, args) do
      {:ok, merchant} ->
        {:ok, merchant}

      error ->
        {:error, "could not update merchant: #{inspect(error)}"}
    end
  end

  @doc """
  Deletes a merchant for an id
  """
  def delete_merchant(_root, %{id: id}, _info) do
    # merchant = Merchants.get_merchant!(id)
    merchant = Persistence.Merchants.get_merchant!(PostgresqlPersistence.Merchants, id)

    # case Merchants.delete_merchant(merchant) do
    case Persistence.Merchants.delete_merchant!(PostgresqlPersistence.Merchants, merchant) do
      {:ok, merchant} ->
        {:ok, merchant}

      error ->
        {:error, "could not delete merchant: #{inspect(error)}"}
    end
  end

  @doc """
  Search for a merchant for an given name specified.
  """
  def search_merchant(_root, %{name: name}, _info) do
    # case Merchants.search_merchant(name) do
    case Persistence.Merchants.search_merchant!(PostgresqlPersistence.Merchants, name) do
      [] -> {:error, "could not find the merchant"}
      merchant -> {:ok, merchant}
    end
  end
end
