defmodule EssenceLinkWeb.Schema.Mutations do
  use Absinthe.Schema.Notation
  alias EssenceLinkWeb.LinksResolver
  alias EssenceLinkWeb.UsersResolver

  # Link
  object :link_mutations do
    field :shorten_url, :link do
      arg(:original_url, non_null(:string))
      resolve(&LinksResolver.shorten_url/3)
    end

    field :update_link, :link do
      arg(:id, non_null(:id))
      arg(:original_url, non_null(:string))
      resolve(&LinksResolver.update_link/3)
    end

    field :delete_link, :deleted_response do
      arg(:id, non_null(:id))
      resolve(&LinksResolver.delete_link/3)
    end
  end

  # User
  object :user_mutations do
    field :register, :auth_payload do
      arg(:email, non_null(:string))
      arg(:name, non_null(:string))
      arg(:password, non_null(:string))

      resolve(&UsersResolver.register/3)
    end

    field :login, :auth_payload do
      arg(:email, non_null(:string))
      arg(:password, non_null(:string))

      resolve(&UsersResolver.login/3)
    end
  end
end
