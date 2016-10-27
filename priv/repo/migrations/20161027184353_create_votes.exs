defmodule PanelVote.Repo.Migrations.CreateVotes do
  use Ecto.Migration

  def change do
  	create table(:votes) do
      add :vote_id, :integer
      add :user_id, :integer
      timestamps
    end
  end
end