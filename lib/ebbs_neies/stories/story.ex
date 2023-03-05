defmodule EbbsNeies.Stories.Story do
  use Ecto.Schema
  import Ecto.Changeset

  schema "stories" do
    field :body, :string
    field :title, :string
    field :user_id, :id

    timestamps()
  end

  @doc false
  def changeset(story, attrs) do
    story
    |> cast(attrs, [:title, :body])
    |> validate_required([:title, :body])
  end
end
