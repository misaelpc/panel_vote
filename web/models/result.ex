defmodule PanelVote.Result do
	import Ecto.Query
	defstruct name: "", percentage: 0

	def calculate_percentage(vm) do
		percentage = (vm_votes(vm) * 100 ) / total_votes
		%PanelVote.Result{name: vm.name, percentage: round(percentage)}
	end

	def total_votes do
		PanelVote.Repo.one(from v in PanelVote.Vote, select: count(v.id))
	end

	def vm_votes(vm)  do
		query = from v in PanelVote.Vote,
          where: v.vote_id == ^vm.id,
          select: count(v.id)
   	PanelVote.Repo.one(query)
	end
end