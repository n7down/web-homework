defmodule HomeworkWeb.Resolvers.CompaniesResolver do
  alias Homework.Companies

  @doc """ 
  Get a list of companies
  """
  def companies(_root, args, _info) do
    {:ok, Companies.list_company(args)}
  end

  @doc """
  Creates a company
  """
  def create_company(_root, args, _info) do
    case Companies.create_company(args) do
      {:ok, company} ->
        {:ok, company}

      error ->
        {:error, "could not create company: #{inspect(error)}"}
    end
  end

  # @doc """
  # Updates a user for an id with args specified.
  # """
  # def update_user(_root, %{id: id} = args, _info) do
  #   user = Users.get_user!(id)

  #   case Users.update_user(user, args) do
  #     {:ok, user} ->
  #       {:ok, user}

  #     error ->
  #       {:error, "could not update user: #{inspect(error)}"}
  #   end
  # end

  # @doc """
  # Deletes a user for an id
  # """
  # def delete_user(_root, %{id: id}, _info) do
  #   user = Users.get_user!(id)

  #   case Users.delete_user(user) do
  #     {:ok, user} ->
  #       {:ok, user}

  #     error ->
  #       {:error, "could not update user: #{inspect(error)}"}
  #   end
  # end

  # @doc """
  # Search for a user for an given first_name and last_name specified.
  # """
  # def search_user(_root, %{first_name: first_name, last_name: last_name}, _info) do
  #   case Users.search_user(first_name, last_name) do
  #     [] -> {:error, "could not find the user"}
  #     user -> {:ok, user}
  #   end
  # end
 
  # @doc """
  # Search for a user for an given first_name and last_name specified.
  # """
  # def search_user(_root, %{first_name: first_name, last_name: last_name}, _info) do
  #   case Users.search_user(first_name, last_name) do
  #     [] -> {:error, "could not find the user"}
  #     user -> {:ok, user}
  #   end
  # end
end


