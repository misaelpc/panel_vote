defmodule PanelSeed do

	def create_virtual_machines do
		vms =
		[%PanelVote.VirtualMachine{name: "JAVA",member: "Enrique Zamudio"},
		%PanelVote.VirtualMachine{name: ".NET",member: "Sergio Acosta"},
		%PanelVote.VirtualMachine{name: "BEAM",member: "Norberto Ortigoza"},
		%PanelVote.VirtualMachine{name: "GO",member: "Veronica López"},
		%PanelVote.VirtualMachine{name: "MRI",member: "David Padilla"},
		%PanelVote.VirtualMachine{name: "V8",member: "Jeduan Cornejo"}]
		Enum.each(vms, fn(vm) -> PanelVote.Repo.insert! vm end)
	end
end

PanelSeed.create_virtual_machines