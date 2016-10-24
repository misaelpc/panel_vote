defmodule PanelVote.PageController do
  use PanelVote.Web, :controller

  def index(conn, _params) do
    render conn, "index.html"
  end
end
