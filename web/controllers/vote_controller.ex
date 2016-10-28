defmodule PanelVote.VoteController do
	use PanelVote.Web, :controller
	alias PanelVote.VirtualMachine
	alias PanelVote.Vote
	alias PanelVote.Result

	def vote(conn, params) do
		vms = VirtualMachine.fetch_all
		changeset = PanelVote.Vote.changeset(%PanelVote.Vote{},params)
		render conn, :vote,
    	vms: vms,
    	changeset: changeset
  end

  def register(conn,%{"vm" => vm_name} =params) do
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