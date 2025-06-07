defmodule EssenceLink.LinksFixtures do
  @moduledoc """
  This module defines test helpers for creating
  entities via the `EssenceLink.Links` context.
  """

  @doc """
  Generate a unique link short_code.
  """
  def unique_link_short_code, do: "some short_code#{System.unique_integer([:positive])}"

  @doc """
  Generate a link.
  """
  def link_fixture(attrs \\ %{}) do
    {:ok, link} =
      attrs
      |> Enum.into(%{
        original_url: "some original_url",
        short_code: unique_link_short_code()
      })
      |> EssenceLink.Links.create_link()

    link
  end
end
