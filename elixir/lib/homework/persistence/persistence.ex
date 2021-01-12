defmodule Homework.Persistence.Users do

  alias Homework.Users.User

  @callback list_users() :: list(%User{}) | Ecto.NoResultsError
  @callback get_user!(charlist()) :: %User{} | Ecto.NoResultsError
  @callback get_user_by_last_name!(charlist()) :: %User{} | Ecto.NoResultsError
  @callback create_user(map()) :: {:ok, %User{}} | {:error, %Ecto.Changeset{}}
  @callback update_user(%User{}, map()) :: {:ok, %User{}} | {:error, %Ecto.Changeset{}}
  @callback delete_user(%User{}) :: {:ok, %User{}} | {:error, %Ecto.Changeset{}}
  @callback search_user(:integer, :integer) :: %User{} | %Ecto.NoResultsError{}
  # @callback pageinate(:integer, :integer) :: list(%User{}) | %Ecto.NoResultsError{}
  # @callback change_user(%User{} = user, attrs \\ %{}) :: %Ecto.Changeset{}
  
  def list_users!(impl) do
    case impl.list_users() do
      :error -> :error
      user -> user
    end
  end

  def create_user!(impl, args) do
    case impl.create_user(args) do
      {:ok, user} -> {:ok, user}
      {:error, %Ecto.Changeset{}} -> {:error, %Ecto.Changeset{}}
    end
  end

  def get_user!(impl, id) do
    case impl.get_user!(id) do
      :error -> :error
      user -> user
    end
  end

  def get_user_by_last_name!(impl, name) do
    case impl.get_user_by_last_name!(name) do
      :error -> :error
      user -> user
    end
  end

  def update_user!(impl, user, args) do
    case impl.update_user(user, args) do
      {:ok, user} -> {:ok, user}
      {:error, %Ecto.Changeset{}} -> {:error, %Ecto.Changeset{}}
    end
  end

  def delete_user!(impl, user) do
    case impl.delete_user(user) do
      {:ok, user} -> {:ok, user}
      {:error, %Ecto.Changeset{}} -> {:error, %Ecto.Changeset{}}
    end
  end

  def search_user!(impl, first_name, last_name) do
    case impl.search_user(first_name, last_name) do
      :error -> :error
      user -> user
    end
  end
end
