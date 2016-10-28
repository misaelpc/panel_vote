defmodule PanelVote.VoteController do
	use PanelVote.Web, :controller
	alias PanelVote.VirtualMachine
	alias PanelVote.Vote
	alias PanelVote.Result
	alias PanelVote.User

	def vote(conn, params) do
		token = get_session(conn, :token)
		user = User.find_by_token(token)
		vms = VirtualMachine.fetch_all
		changeset = PanelVote.Vote.changeset(%PanelVote.Vote{},params)
		IO.inspect user
		render conn, :vote,
    	vms: vms,
    	voted: user.voted,
    	changeset: changeset
  end

  def register(conn,%{"vm" => vm_name} =params) do
  	token = get_session(conn, :token)
		user = User.find_by_token(token)

		change = Ecto.Changeset.change user, voted: true
    PanelVote.Repo.update!(change)

  	vm = VirtualMachine.find_by_name(vm_name)
		Vote.register(vm)
		vms = VirtualMachine.fetch_all
		entries = Enum.map(vms, fn(vm) -> Result.calculate_percentage(vm) end)
  	render conn, :results,
  		entries: entries
  end

  def results(conn, _params) do
  	vms = VirtualMachine.fetch_all
    entries = Enum.map(vms, fn(vm) -> Result.calculate_percentage(vm) end)
  	render conn, :results,
  		entries: entries
  end
end