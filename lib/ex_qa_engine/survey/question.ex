defmodule ExQaEngine.Survey.Question do
  use Ecto.Schema
  import Ecto.Changeset
  alias ExQaEngine.Survey.Question


  schema "questions" do
    field :content, :string
    field :points, :integer
    field :title, :string

    timestamps()
  end

  @doc false
  def changeset(%Question{} = question, attrs) do
    question
    |> cast(attrs, [:title, :content, :points])
    |> validate_required([:title, :content, :points])
  end
end
