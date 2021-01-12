defmodule Homework.Persistence.Companies do

  alias Homework.Companies.Company

  @callback list_companies() :: list(%Company{}) | Ecto.NoResultsError
  @callback get_company!(charlist()) :: %Company{} | Ecto.NoResultsError
  @callback get_company_by_name!(charlist()) :: %Company{} | Ecto.NoResultsError
  @callback create_company(map()) :: {:ok, %Company{}} | {:error, %Ecto.Changeset{}}
  @callback update_company(%Company{}, map()) :: {:ok, %Company{}} | {:error, %Ecto.Changeset{}}
  @callback delete_company(%Company{}) :: {:ok, %Company{}} | {:error, %Ecto.Changeset{}}
  @callback search_company(charlist()) :: %Company{} | %Ecto.NoResultsError{}
  # @callback pageinate(:integer, :integer) :: list(%User{}) | %Ecto.NoResultsError{}
  # @callback change_user(%User{} = user, attrs \\ %{}) :: %Ecto.Changeset{}
  
  def list_companies!(impl) do
    case impl.list_companies() do
      :error -> :error
      company -> company 
    end
  end

  def create_company!(impl, args) do
    case impl.create_company(args) do
      {:ok, company} -> {:ok, company}
      {:error, %Ecto.Changeset{}} -> {:error, %Ecto.Changeset{}}
    end
  end

  def get_company!(impl, id) do
    case impl.get_company!(id) do
      :error -> :error
      company -> company 
    end
  end

  def get_company_by_last_name!(impl, company) do
    case impl.get_company_by_last_name!(company) do
      :error -> :error
      company -> company 
    end
  end

  def update_company!(impl, company, args) do
    case impl.update_company(company, args) do
      {:ok, company} -> {:ok, company}
      {:error, %Ecto.Changeset{}} -> {:error, %Ecto.Changeset{}}
    end
  end

  def delete_company!(impl, company) do
    case impl.delete_company(company) do
      {:ok, company} -> {:ok, company}
      {:error, %Ecto.Changeset{}} -> {:error, %Ecto.Changeset{}}
    end
  end

  def search_company!(impl, name) do
    case impl.search_company(name) do
      :error -> :error
      company -> company
    end
  end
end
