defmodule ExQaEngine.Repo.Migrations.CreateQuestions do
  use Ecto.Migration

  def change do
    create table(:questions) do
      add :points, :integer
      add :title, :string
      add :content, :text

      timestamps()
    end

  end
end
