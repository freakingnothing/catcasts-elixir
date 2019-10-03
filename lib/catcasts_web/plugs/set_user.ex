defmodule Catcasts.Plugs.SetUser do
  import Plug.Conn

  alias Catcasts.{Repo, User}

  def init(_params) do
  end

  def call(conn, _params) do
    if conn.assigns[:current_user] do
      conn
    else
      user_id = get_session(conn, :current_user_id)

      cond do
        current_user = user_id && Repo.get(User, user_id) ->
          conn
          |> assign(:current_user, current_user)
        true ->
          conn
          |> assign(:current_user, nil)
      end
    end
  end
end
