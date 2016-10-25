defmodule PanelVote.LoginController do
  use PanelVote.Web, :controller

  def index(conn, _params) do
    render conn, "index.html"
  end


  def create_user(conn, _params) do
  	conn
      |> put_status(201)
      |> json(_params)
  end
end
