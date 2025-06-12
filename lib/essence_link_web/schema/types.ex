defmodule EssenceLinkWeb.Schema.Types do
  use Absinthe.Schema.Notation

  # Link
  object :link do
    field :id, :id
    field :original_url, :string
    field :short_code, :string
  end

  object :deleted_response do
    field :id, :id
  end

  # User
  object :user do
    field :id, :id
    field :email, :string
    field :name, :string
  end

  object :auth_payload do
    field :token, :string
    field :refresh_token, :string
    field :user, :user
  end
end
