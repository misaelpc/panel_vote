defmodule PanelVote.Repo.Migrations.CreateVirtualMachines do
  use Ecto.Migration

  def change do
  	create table(:virtual_machines) do
      add :name, :string
      add :member, :string
      timestamps
    end
  end
end
