defmodule PanelVote.LoginController do
  use PanelVote.Web, :controller
  alias PanelVote.User

  def index(conn, _params) do
    render conn, "index.html"
  end


  def create_user(conn, %{"token" => token} = params) do
  	conn
      |> redirect(to: "/register/#{token}")
  end

  def register(conn, %{"token" => token} = params) do
  	case User.find_by_token(token) do
  		nil ->
  			PanelVote.Repo.insert(%User{token: token, voted: false})
  		_ ->
  			IO.inspect "User Already registered"
  	end
  	conn
  		|> put_session(:token, token)
      |> redirect(to: "/vote")
  end
end
