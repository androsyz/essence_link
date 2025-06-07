defmodule EssenceLink.LinksTest do
  use EssenceLink.DataCase, async: true

  alias EssenceLink.Links
  alias EssenceLink.Links.Link

  @valid_attrs %{"original_url" => "https://example.com"}
  @update_attrs %{"original_url" => "https://updated.com"}
  @invalid_attrs %{"original_url" => nil}

  describe "list_links/0" do
    test "returns all links" do
      {:ok, link} = Links.create_link(@valid_attrs)
      assert [^link] = Links.list_links()
    end
  end

  describe "get_link!/1" do
    test "returns the link with given id" do
      {:ok, link} = Links.create_link(@valid_attrs)
      result = Links.get_link!(link.id)
      assert %Link{} = result
      assert result.id == link.id
    end

    test "raises if link not found" do
      assert_raise Ecto.NoResultsError, fn ->
        Links.get_link!(-1)
      end
    end
  end

  describe "get_link_by_short_code/1" do
    test "returns the link with the given short_code" do
      {:ok, link} = Links.create_link(@valid_attrs)
      result = Links.get_link_by_short_code(link.short_code)
      assert %Link{} = result
      assert result.short_code == link.short_code
    end
  end

  describe "create_link/1" do
    test "creates link with valid data and generates short_code" do
      {:ok, link} = Links.create_link(@valid_attrs)
      assert link.original_url == @valid_attrs["original_url"]
      assert is_binary(link.short_code)
      assert String.length(link.short_code) == 6
    end

    test "returns error changeset with invalid data" do
      {:error, changeset} = Links.create_link(@invalid_attrs)
      assert %{original_url: ["can't be blank"]} = errors_on(changeset)
    end
  end

  describe "update_link/2" do
    test "updates the link with valid data" do
      {:ok, link} = Links.create_link(@valid_attrs)
      {:ok, updated_link} = Links.update_link(link, @update_attrs)
      assert updated_link.original_url == @update_attrs["original_url"]
    end

    test "returns error changeset with invalid data" do
      {:ok, link} = Links.create_link(@valid_attrs)
      {:error, changeset} = Links.update_link(link, @invalid_attrs)
      assert %{original_url: ["can't be blank"]} = errors_on(changeset)
    end
  end

  describe "delete_link/1" do
    test "deletes the link" do
      {:ok, link} = Links.create_link(@valid_attrs)
      {:ok, _deleted_link} = Links.delete_link(link)
      assert_raise Ecto.NoResultsError, fn ->
        Links.get_link!(link.id)
      end
    end
  end
end
