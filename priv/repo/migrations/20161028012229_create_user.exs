defmodule PanelVote.Repo.Migrations.CreateUser do
  use Ecto.Migration

  def change do
  	create table(:users) do
      add :token, :string
      add :voted, :boolean
      timestamps
    end
  end

end
