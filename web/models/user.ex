defmodule PanelVote.User do
  use Ecto.Model
  import Ecto.Query

  schema "users" do
    field :token, :string
    field :voted, :boolean
    timestamps
  end

  def find_by_token(token) do
    query = from u in PanelVote.User,
          where: u.token == ^token,
          select: u
    PanelVote.Repo.one(query)
  end
end