defmodule EssenceLinkWeb.Schema.Queries do
  use Absinthe.Schema.Notation
  alias EssenceLinkWeb.LinksResolver
  alias EssenceLinkWeb.UsersResolver

  # Link
  object :link_queries do
    field :get_link, :link do
      arg(:short_code, non_null(:string))
      resolve(&LinksResolver.get_link/3)
    end

    field :list_links, list_of(:link) do
      resolve(&LinksResolver.list_links/3)
    end
  end

  # User
  object :user_queries do
    field :get_user, :user do
      arg(:id, non_null(:id))
      resolve(&UsersResolver.get_user/3)
    end
  end
end
