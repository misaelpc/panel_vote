defmodule PanelVote.VirtualMachine do
  use Ecto.Model
  import Ecto.Query

  schema "virtual_machines" do
    field :name, :string
    field :member, :string
    timestamps
  end

  def fetch_all do
    PanelVote.Repo.all(from v in PanelVote.VirtualMachine)
  end

  def find_by_name(name) do
    query = from vm in PanelVote.VirtualMachine,
          where: vm.name == ^name,
          select: vm
    PanelVote.Repo.one(query)
  end
end