defmodule HomeworkWeb.Resolvers.UsersResolver do
  alias Homework.Persistence
  alias Homework.PostgresqlPersistence

  @doc """ 
  Get a list of users
  """
  def users(_root, _args, _info) do
    {:ok, Persistence.Users.list_users!(PostgresqlPersistence.Users)}
  end

  @doc """
  Creates a user
  """
  def create_user(_root, args, _info) do
    case Persistence.Users.create_user!(PostgresqlPersistence.Users, args) do
      {:ok, user} ->
        {:ok, user}

      error ->
        {:error, "could not create user: #{inspect(error)}"}
    end
  end

  @doc """
  Updates a user for an id with args specified.
  """
  def update_user(_root, %{id: id} = args, _info) do
    user = Persistence.Users.get_user!(PostgresqlPersistence.Users, id)

    case Persistence.Users.update_user!(PostgresqlPersistence.Users, user, args) do
      {:ok, user} ->
        {:ok, user}

      error ->
        {:error, "could not update user: #{inspect(error)}"}
    end
  end

  @doc """
  Deletes a user for an id
  """
  def delete_user(_root, %{id: id}, _info) do
    user = Persistence.Users.get_user!(PostgresqlPersistence.Users, id)

    case Persistence.Users.delete_user!(PostgresqlPersistence.Users, user) do
      {:ok, user} ->
        {:ok, user}

      error ->
        {:error, "could not delete user: #{inspect(error)}"}
    end
  end

  @doc """
  Search for a user for an given first_name and last_name specified.
  """
  def search_user(_root, %{first_name: first_name, last_name: last_name}, _info) do
    case Persistence.Users.search_user!(PostgresqlPersistence.Users, first_name, last_name) do
      [] -> {:error, "could not find the user"}
      user -> {:ok, user}
    end
  end
end


