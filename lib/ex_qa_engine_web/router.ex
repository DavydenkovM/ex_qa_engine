defmodule ExQaEngineWeb.Router do
  use ExQaEngineWeb, :router

  pipeline :api do
    plug :accepts, ["json"]
  end

  scope "/api", ExQaEngineWeb do
    pipe_through :api

    options "/questions", QuestionController, :options
    resources "/questions", QuestionController, except: [:new, :edit]
  end
end
