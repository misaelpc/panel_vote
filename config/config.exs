# This file is responsible for configuring your application
# and its dependencies with the aid of the Mix.Config module.
#
# This configuration file is loaded before any dependency and
# is restricted to this project.
use Mix.Config

# General application configuration
config :panel_vote,
  ecto_repos: [PanelVote.Repo]

# Configures the endpoint
config :panel_vote, PanelVote.Endpoint,
  url: [host: "localhost"],
  secret_key_base: "/SIYjcbQvWZU1A4xkegS+b58yDpZV6+3XvG2+YXZGx/LnLmt2UnxlWmdyJH/Tm/L",
  render_errors: [view: PanelVote.ErrorView, accepts: ~w(html json)],
  pubsub: [name: PanelVote.PubSub,
           adapter: Phoenix.PubSub.PG2]

# Configures Elixir's Logger
config :logger, :console,
  format: "$time $metadata[$level] $message\n",
  metadata: [:request_id]

# Import environment specific config. This must remain at the bottom
# of this file so it overrides the configuration defined above.
import_config "#{Mix.env}.exs"
