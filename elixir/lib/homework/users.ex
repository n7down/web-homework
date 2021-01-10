defmodule Homework.Users do
  @moduledoc """
  The Users context.
  """

  import Ecto.Query, warn: false
  alias Homework.Repo

  alias Homework.Users.User

  @doc """
  Returns the list of users.

  ## Examples

      iex> list_users([])
      [%User{}, ...]

  """
  def list_users(_args) do
    Repo.all(User)
  end

  @doc """
  Gets a single user.

  Raises `Ecto.NoResultsError` if the User does not exist.

  ## Examples

      iex> get_user!(123)
      %User{}

      iex> get_user!(456)
      ** (Ecto.NoResultsError)

  """
  def get_user!(id), do: Repo.get!(User, id)

  @doc """
  Gets a single user by last name.

  Raises `Ecto.NoResultsError` if the User does not exist.

  ## Examples

      iex> get_user_by_last_name!(123)
      %User{}

      iex> get_user_by_last_name!(456)
      ** (Ecto.NoResultsError)

  """
  def get_user_by_last_name!(name) do 
    query = from(
      u in User, 
      where: u.last_name == ^name
    )
    Repo.one(query)
  end

  @doc """
  Creates a user.

  ## Examples

      iex> create_user(%{field: value})
      {:ok, %User{}}

      iex> create_user(%{field: bad_value})
      {:error, %Ecto.Changeset{}}

  """
  def create_user(attrs \\ %{}) do
    %User{}
    |> User.changeset(attrs)
    |> Repo.insert()
  end

  @doc """
  Updates a user.

  ## Examples

      iex> update_user(user, %{field: new_value})
      {:ok, %User{}}

      iex> update_user(user, %{field: bad_value})
      {:error, %Ecto.Changeset{}}

  """
  def update_user(%User{} = user, attrs) do
    user
    |> User.changeset(attrs)
    |> Repo.update()
  end

  @doc """
  Deletes a user.

  ## Examples

      iex> delete_user(user)
      {:ok, %User{}}

      iex> delete_user(user)
      {:error, %Ecto.Changeset{}}

  """
  def delete_user(%User{} = user) do
    Repo.delete(user)
  end

  @doc """
  Search for a user by first and last name.

  ## Examples

      iex> search_user(user)
      {:ok, %User{}}

      iex> search_user(user)
      {:error, %Ecto.Changeset{}}

  """
  def search_user(first_name, last_name) do 
    query = from(
      u in User, 
      where: ilike(u.first_name, ^"%#{first_name}%"),
      where: ilike(u.last_name, ^"%#{last_name}%")
    )
    result = Repo.all(query)
    {:ok, result}
  end

  @doc """
  Pageinate through all users ordered by last name and first name asc given the limit and skip values.
  Returns the results and the total number of results.
  """
  def pageinate(limit, skip) do
    query = from u in User, 
      select: u,
      order_by: [asc: u.last_name, asc: u.first_name],
      limit: ^limit,
      offset: ^skip
    results = Repo.all(query)
    %{results: results, total_rows: length(results)}
  end

  @doc """
  Returns an `%Ecto.Changeset{}` for tracking user changes.

  ## Examples

      iex> change_user(user)
      %Ecto.Changeset{data: %User{}}

  """
  def change_user(%User{} = user, attrs \\ %{}) do
    User.changeset(user, attrs)
  end
end
