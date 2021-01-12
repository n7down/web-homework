defmodule Homework.Persistence.Merchants do

  alias Homework.Merchants.Merchant

  @callback list_merchants() :: list(%Merchant{}) | Ecto.NoResultsError
  @callback get_merchant!(charlist()) :: %Merchant{} | Ecto.NoResultsError
  @callback get_merchant_by_name!(charlist()) :: %Merchant{} | Ecto.NoResultsError
  @callback create_merchant(map()) :: {:ok, %Merchant{}} | {:error, %Ecto.Changeset{}}
  @callback update_merchant(%Merchant{}, map()) :: {:ok, %Merchant{}} | {:error, %Ecto.Changeset{}}
  @callback delete_merchant(%Merchant{}) :: {:ok, %Merchant{}} | {:error, %Ecto.Changeset{}}
  @callback search_merchant(charlist()) :: %Merchant{} | %Ecto.NoResultsError{}
  # @callback pageinate(:integer, :integer) :: list(%User{}) | %Ecto.NoResultsError{}
  # @callback change_user(%User{} = user, attrs \\ %{}) :: %Ecto.Changeset{}
  
  def list_merchants!(impl) do
    case impl.list_merchants() do
      :error -> :error
      merchant -> merchant 
    end
  end

  def create_merchant!(impl, args) do
    case impl.create_merchant(args) do
      {:ok, merchant} -> {:ok, merchant}
      {:error, %Ecto.Changeset{}} -> {:error, %Ecto.Changeset{}}
    end
  end

  def get_merchant!(impl, id) do
    case impl.get_merchant(id) do
      :error -> :error
      merchant -> merchant 
    end
  end

  def get_merchant_by_name!(impl, merchant) do
    case impl.get_merchant_by_name!(merchant) do
      :error -> :error
      merchant -> merchant 
    end
  end

  def update_merchant!(impl, merchant, args) do
    case impl.update_merchant(merchant, args) do
      {:ok, merchant} -> {:ok, merchant}
      {:error, %Ecto.Changeset{}} -> {:error, %Ecto.Changeset{}}
    end
  end

  def delete_merchant!(impl, merchant) do
    case impl.delete_merchant(merchant) do
      {:ok, merchant} -> {:ok, merchant}
      {:error, %Ecto.Changeset{}} -> {:error, %Ecto.Changeset{}}
    end
  end

  def search_merchant!(impl, name) do
    case impl.search_merchant(name) do
      :error -> :error
      merchant -> merchant 
    end
  end
end
