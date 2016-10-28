defmodule PanelVote.LoginController do
  use PanelVote.Web, :controller

  def index(conn, _params) do
    render conn, "index.html"
  end


  def create_user(conn, %{"token" => token} = params) do
  	conn
  		|> get("/")
  		|> put_session(:token, token)
      |> redirect(to: "/vote")
  end
end
