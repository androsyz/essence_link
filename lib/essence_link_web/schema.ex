defmodule EssenceLinkWeb.Schema do
  use Absinthe.Schema
  alias EssenceLinkWeb.LinksResolver

  query do
    field :get_link, :link do
      arg :short_code, non_null(:string)
      resolve &LinksResolver.get_link/3
    end

    field :list_links, list_of(:link) do
      resolve &LinksResolver.list_links/3
    end
  end

  mutation do
    field :shorten_url, :link do
      arg :original_url, non_null(:string)
      resolve &LinksResolver.shorten_url/3
    end

    field :update_link, :link do
      arg :id, non_null(:id)
      arg :original_url, non_null(:string)
      resolve &LinksResolver.update_link/3
    end

    field :delete_link, :deleted_response do
      arg :id, non_null(:id)
      resolve &LinksResolver.delete_link/3
    end
  end

  object :link do
    field :id, :id
    field :original_url, :string
    field :short_code, :string
  end

  object :deleted_response do
    field :id, :id
  end
end
