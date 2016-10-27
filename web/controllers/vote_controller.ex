defmodule PanelVote.VoteController do
	use PanelVote.Web, :controller

	def vote(conn, _params) do
    render conn, "vote.html"
  end

  def results(conn, _params) do
    render conn, "results.html"
  end
end