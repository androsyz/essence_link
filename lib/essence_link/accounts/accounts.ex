defmodule EssenceLink.Accounts do
  alias EssenceLink.Repo
  alias EssenceLink.Accounts.User

  def register_user(attrs) do
    %User{}
    |> User.changeset(attrs)
    |> Repo.insert()
  end

  def get_user_by_email(email), do: Repo.get_by(User, email: email)

  def authenticate_user(email, password) do
    case get_user_by_email(email) do
      %User{} = user ->
        if Bcrypt.verify_pass(password, user.password) do
          {:ok, user}
        else
          {:error, "Invalid email or password"}
        end

      _ ->
        {:error, "Invalid email or password"}
    end
  end

  def get_user(id), do: Repo.get(User, id)
end
