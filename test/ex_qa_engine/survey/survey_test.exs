defmodule ExQaEngine.SurveyTest do
  use ExQaEngine.DataCase

  alias ExQaEngine.Survey

  describe "questions" do
    alias ExQaEngine.Survey.Question

    @valid_attrs %{content: "some content", points: 42, title: "some title"}
    @update_attrs %{content: "some updated content", points: 43, title: "some updated title"}
    @invalid_attrs %{content: nil, points: nil, title: nil}

    def question_fixture(attrs \\ %{}) do
      {:ok, question} =
        attrs
        |> Enum.into(@valid_attrs)
        |> Survey.create_question()

      question
    end

    test "list_questions/0 returns all questions" do
      question = question_fixture()
      assert Survey.list_questions() == [question]
    end

    test "get_question!/1 returns the question with given id" do
      question = question_fixture()
      assert Survey.get_question!(question.id) == question
    end

    test "create_question/1 with valid data creates a question" do
      assert {:ok, %Question{} = question} = Survey.create_question(@valid_attrs)
      assert question.content == "some content"
      assert question.points == 42
      assert question.title == "some title"
    end

    test "create_question/1 with invalid data returns error changeset" do
      assert {:error, %Ecto.Changeset{}} = Survey.create_question(@invalid_attrs)
    end

    test "update_question/2 with valid data updates the question" do
      question = question_fixture()
      assert {:ok, question} = Survey.update_question(question, @update_attrs)
      assert %Question{} = question
      assert question.content == "some updated content"
      assert question.points == 43
      assert question.title == "some updated title"
    end

    test "update_question/2 with invalid data returns error changeset" do
      question = question_fixture()
      assert {:error, %Ecto.Changeset{}} = Survey.update_question(question, @invalid_attrs)
      assert question == Survey.get_question!(question.id)
    end

    test "delete_question/1 deletes the question" do
      question = question_fixture()
      assert {:ok, %Question{}} = Survey.delete_question(question)
      assert_raise Ecto.NoResultsError, fn -> Survey.get_question!(question.id) end
    end

    test "change_question/1 returns a question changeset" do
      question = question_fixture()
      assert %Ecto.Changeset{} = Survey.change_question(question)
    end
  end
end
