defmodule PanelVote.VirtualMachine do
  use Ecto.Model
  import Ecto.Query

  schema "virtual_machines" do
    field :name, :string
    field :member, :string
    timestamps
  end

end