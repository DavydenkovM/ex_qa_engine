defmodule ExQaEngine.Survey do
  @moduledoc """
  The Survey context.
  """

  import Ecto.Query, warn: false
  alias ExQaEngine.Repo

  alias ExQaEngine.Survey.Question

  @doc """
  Returns the list of questions.

  ## Examples

      iex> list_questions()
      [%Question{}, ...]

  """
  def list_questions() do
    Repo.all(Question)
  end
  def list_questions(%{"_sort" => psort, "_order" => porder, "_start" => pstart, "_end" => pend}) do
    sort = (psort || "id") |> String.to_atom
    order = (porder || "DESC") |> String.downcase |> String.to_atom
    order_by_clause = Keyword.new([{order, sort}])

    Repo.all(from r in Question,
      where: r.id > ^pstart and r.id < ^pend,
      order_by: ^order_by_clause)
  end
  def list_questions(%{}) do
    list_questions()
  end

  def questions_count do
    Repo.aggregate(Question, :count, :id)
  end

  @doc """
  Gets a single question.

  Raises `Ecto.NoResultsError` if the Question does not exist.

  ## Examples

      iex> get_question!(123)
      %Question{}

      iex> get_question!(456)
      ** (Ecto.NoResultsError)

  """
  def get_question!(id), do: Repo.get!(Question, id)

  @doc """
  Creates a question.

  ## Examples

      iex> create_question(%{field: value})
      {:ok, %Question{}}

      iex> create_question(%{field: bad_value})
      {:error, %Ecto.Changeset{}}

  """
  def create_question(attrs \\ %{}) do
    %Question{}
    |> Question.changeset(attrs)
    |> Repo.insert()
  end

  @doc """
  Updates a question.

  ## Examples

      iex> update_question(question, %{field: new_value})
      {:ok, %Question{}}

      iex> update_question(question, %{field: bad_value})
      {:error, %Ecto.Changeset{}}

  """
  def update_question(%Question{} = question, attrs) do
    question
    |> Question.changeset(attrs)
    |> Repo.update()
  end

  @doc """
  Deletes a Question.

  ## Examples

      iex> delete_question(question)
      {:ok, %Question{}}

      iex> delete_question(question)
      {:error, %Ecto.Changeset{}}

  """
  def delete_question(%Question{} = question) do
    Repo.delete(question)
  end

  @doc """
  Returns an `%Ecto.Changeset{}` for tracking question changes.

  ## Examples

      iex> change_question(question)
      %Ecto.Changeset{source: %Question{}}

  """
  def change_question(%Question{} = question) do
    Question.changeset(question, %{})
  end
end
