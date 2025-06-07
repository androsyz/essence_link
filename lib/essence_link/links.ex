defmodule EssenceLink.Links do
  import Ecto.Query, warn: false
  alias EssenceLink.Repo
  alias EssenceLink.Links.Link

  @doc """
  Returns all stored links.
  """
  def list_links do
    Repo.all(Link)
  end

  @doc """
  Retrieves a single link by its database ID.

  Raises `Ecto.NoResultsError` if not found.
  """
  def get_link!(id), do: Repo.get!(Link, id)

  @doc """
  Retrieves a link by its short code. Returns `nil` if not found.
  """
  def get_link_by_short_code(code), do: Repo.get_by(Link, short_code: code)

  @doc """
  Creates a new shortened link. Automatically generates a short code.
  """
  def create_link(attrs) do
    short_code = generate_short_code()
    attrs = Map.put(attrs, "short_code", short_code)

    %Link{}
    |> Link.changeset(attrs)
    |> Repo.insert()
  end

  @doc """
  Updates an existing link with new attributes.
  """
  def update_link(%Link{} = link, attrs) do
    link
    |> Link.changeset(attrs)
    |> Repo.update()
  end

  @doc """
  Deletes the given link from the database.
  """
  def delete_link(%Link{} = link), do: Repo.delete(link)

  @doc false
  defp generate_short_code do
    :crypto.strong_rand_bytes(4)
    |> Base.url_encode64(padding: false)
    |> binary_part(0, 6)
  end
end
