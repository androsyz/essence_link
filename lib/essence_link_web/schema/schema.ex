defmodule EssenceLinkWeb.Schema do
  use Absinthe.Schema

  import_types(EssenceLinkWeb.Schema.Types)
  import_types(EssenceLinkWeb.Schema.Queries)
  import_types(EssenceLinkWeb.Schema.Mutations)

  query do
    import_fields :link_queries
    import_fields :user_queries
  end

  mutation do
    import_fields :link_mutations
    import_fields :user_mutations
  end
end
