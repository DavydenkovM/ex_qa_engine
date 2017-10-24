defmodule ExQaEngine.Repo.Migrations.AddQuestionsIndexes do
  use Ecto.Migration
  @disable_ddl_transaction true

  def change do
    create index("questions", [:points], concurrently: true)
    create index("questions", [:title], concurrently: true)
  end
end
