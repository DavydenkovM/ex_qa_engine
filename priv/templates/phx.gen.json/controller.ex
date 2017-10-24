defmodule <%= inspect context.web_module %>.<%= inspect Module.concat(schema.web_namespace, schema.alias) %>Controller do
  use <%= inspect context.web_module %>, :controller

  alias <%= inspect context.module %>
  alias <%= inspect schema.module %>

  action_fallback <%= inspect context.web_module %>.FallbackController

  def index(conn, params) do
    <%= schema.plural %> = <%= inspect context.alias %>.list_<%= schema.plural %>(params)
    conn
    |> put_resp_header("x-total-count", "#{<%= inspect context.alias %>.<%= schema.plural %>_count()}")
    |> render("index.json", <%= schema.plural %>: <%= schema.plural %>)
  end

  def create(conn, %{<%= inspect schema.singular %> => <%= schema.singular %>_params}) do
    with {:ok, %<%= inspect schema.alias %>{} = <%= schema.singular %>} <- <%= inspect context.alias %>.create_<%= schema.singular %>(<%= schema.singular %>_params) do
      conn
      |> put_status(:created)
      |> put_resp_header("location", <%= schema.route_helper %>_path(conn, :show, <%= schema.singular %>))
      |> render("show.json", <%= schema.singular %>: <%= schema.singular %>)
    end
  end

  def show(conn, %{"id" => id}) do
    <%= schema.singular %> = <%= inspect context.alias %>.get_<%= schema.singular %>!(id)
    render(conn, "show.json", <%= schema.singular %>: <%= schema.singular %>)
  end

  def update(conn, %{"id" => id, <%= inspect schema.singular %> => <%= schema.singular %>_params}) do
    <%= schema.singular %> = <%= inspect context.alias %>.get_<%= schema.singular %>!(id)

    with {:ok, %<%= inspect schema.alias %>{} = <%= schema.singular %>} <- <%= inspect context.alias %>.update_<%= schema.singular %>(<%= schema.singular %>, <%= schema.singular %>_params) do
      render(conn, "show.json", <%= schema.singular %>: <%= schema.singular %>)
    end
  end

  def delete(conn, %{"id" => id}) do
    <%= schema.singular %> = <%= inspect context.alias %>.get_<%= schema.singular %>!(id)
    with {:ok, %<%= inspect schema.alias %>{}} <- <%= inspect context.alias %>.delete_<%= schema.singular %>(<%= schema.singular %>) do
      send_resp(conn, :no_content, "")
    end
  end
end
