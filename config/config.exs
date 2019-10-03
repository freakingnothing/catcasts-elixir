# General application configuration
use Mix.Config

config :catcasts,
  ecto_repos: [Catcasts.Repo]

# Configures the endpoint
config :catcasts, CatcastsWeb.Endpoint,
  url: [host: "localhost"],
  secret_key_base: "W8Qc1+47LG1nmsbGApEfsLx5u3JMjn5nQAMqJFKPnJKr/6FF4C9B5HcqSYYc1B2w",
  render_errors: [view: CatcastsWeb.ErrorView, accepts: ~w(html json)],
  pubsub: [name: Catcasts.PubSub, adapter: Phoenix.PubSub.PG2]

# Configures Elixir's Logger
config :logger, :console,
  format: "$time $metadata[$level] $message\n",
  metadata: [:request_id]

# Use Jason for JSON parsing in Phoenix
config :phoenix, :json_library, Jason

# Configures Google OAuth
config :ueberauth, Ueberauth,
  providers: [
    google: {Ueberauth.Strategy.Google, []}
  ]

config :ueberauth, Ueberauth.Strategy.Google.OAuth,
  client_id: System.get_env("GOOGLE_CLIENT_ID"),
  client_secret: System.get_env("GOOGLE_CLIENT_SECRET")

# Import environment specific config. This must remain at the bottom
# of this file so it overrides the configuration defined above.
import_config "#{Mix.env()}.exs"
