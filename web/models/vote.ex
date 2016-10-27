defmodule PanelVote.Vote do
  use Ecto.Schema
  import Ecto.Changeset

  schema "votes" do
    field :vote_id, :integer
    field :user_id, :integer
    timestamps
  end

  def register(vm) do
    vote = %PanelVote.Vote{vote_id: vm.id,user_id: 3}
    PanelVote.Repo.insert!(vote)
  end

  def changeset(vote, params \\ :empty) do
    vote
    |> cast(params, ~w(vote_id))
  end


end


