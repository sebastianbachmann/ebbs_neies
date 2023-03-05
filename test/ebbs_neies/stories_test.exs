defmodule EbbsNeies.StoriesTest do
  use EbbsNeies.DataCase

  alias EbbsNeies.Stories

  describe "stories" do
    alias EbbsNeies.Stories.Story

    import EbbsNeies.StoriesFixtures

    @invalid_attrs %{body: nil, title: nil}

    test "list_stories/0 returns all stories" do
      story = story_fixture()
      assert Stories.list_stories() == [story]
    end

    test "get_story!/1 returns the story with given id" do
      story = story_fixture()
      assert Stories.get_story!(story.id) == story
    end

    test "create_story/1 with valid data creates a story" do
      valid_attrs = %{body: "some body", title: "some title"}

      assert {:ok, %Story{} = story} = Stories.create_story(valid_attrs)
      assert story.body == "some body"
      assert story.title == "some title"
    end

    test "create_story/1 with invalid data returns error changeset" do
      assert {:error, %Ecto.Changeset{}} = Stories.create_story(@invalid_attrs)
    end

    test "update_story/2 with valid data updates the story" do
      story = story_fixture()
      update_attrs = %{body: "some updated body", title: "some updated title"}

      assert {:ok, %Story{} = story} = Stories.update_story(story, update_attrs)
      assert story.body == "some updated body"
      assert story.title == "some updated title"
    end

    test "update_story/2 with invalid data returns error changeset" do
      story = story_fixture()
      assert {:error, %Ecto.Changeset{}} = Stories.update_story(story, @invalid_attrs)
      assert story == Stories.get_story!(story.id)
    end

    test "delete_story/1 deletes the story" do
      story = story_fixture()
      assert {:ok, %Story{}} = Stories.delete_story(story)
      assert_raise Ecto.NoResultsError, fn -> Stories.get_story!(story.id) end
    end

    test "change_story/1 returns a story changeset" do
      story = story_fixture()
      assert %Ecto.Changeset{} = Stories.change_story(story)
    end
  end
end
