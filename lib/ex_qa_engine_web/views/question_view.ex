defmodule ExQaEngineWeb.QuestionView do
  use ExQaEngineWeb, :view
  alias ExQaEngineWeb.QuestionView

  def render("index.json", %{questions: questions}) do
    render_many(questions, QuestionView, "question.json")
  end

  def render("show.json", %{question: question}) do
    render_one(question, QuestionView, "question.json")
  end

  def render("question.json", %{question: question}) do
    %{id: question.id,
      title: question.title,
      content: question.content,
      points: question.points}
  end
end
