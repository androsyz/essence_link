defmodule EssenceLinkWeb.LinksResolver do
  alias EssenceLink.Links

  def shorten_url(_, %{original_url: url}, _) do
    case Links.create_link(%{"original_url" => url}) do
      {:ok, link} -> {:ok, link}
      {:error, _} -> {:error, "Failed to create short link"}
    end
  end

  def get_link(_, %{short_code: code}, _) do
    case Links.get_link_by_short_code(code) do
      nil -> {:error, "Link not found"}
      link -> {:ok, link}
    end
  end

  def update_link(_, %{id: id, original_url: url}, _) do
    link = Links.get_link!(id)

    case Links.update_link(link, %{"original_url" => url}) do
      {:ok, updated} -> {:ok, updated}
      {:error, _} -> {:error, "Failed to update link"}
    end
  end

  def delete_link(_, %{id: id}, _) do
    link = Links.get_link!(id)

    case Links.delete_link(link) do
      {:ok, _} -> {:ok, %{id: id}}
      {:error, _} -> {:error, "Failed to delete link"}
    end
  end

  def list_links(_, _, _) do
    {:ok, Links.list_links()}
  end
end
