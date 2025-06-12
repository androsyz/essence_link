defmodule EssenceLinkWeb.UsersResolver do
  alias EssenceLink.Accounts
  alias EssenceLinkWeb.Helpers.ErrorHelper

  def register(_, %{email: email, name: name, password: password}, _) do
    case Accounts.register_user(%{email: email, name: name, password: password}) do
      {:ok, user} ->
        {:ok, %{user: user}}

      {:error, changeset} ->
        {:error, "Failed to register user: #{ErrorHelper.format_changeset_errors(changeset)}"}
    end
  end

  def login(_, %{email: email, password: password}, _) do
    case Accounts.authenticate_user(email, password) do
      {:ok, user} -> {:ok, %{user: user}}
      {:error, reason} -> {:error, reason}
    end
  end

  def get_user(_, %{id: id}, _) do
    case Accounts.get_user(id) do
      nil -> {:error, "User not found"}
      user -> {:ok, user}
    end
  end
end
