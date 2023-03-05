defmodule EbbsNeies.StoriesFixtures do
  @moduledoc """
  This module defines test helpers for creating
  entities via the `EbbsNeies.Stories` context.
  """

  @doc """
  Generate a story.
  """
  def story_fixture(attrs \\ %{}) do
    {:ok, story} =
      attrs
      |> Enum.into(%{
        body: "some body",
        title: "some title"
      })
      |> EbbsNeies.Stories.create_story()

    story
  end
end
