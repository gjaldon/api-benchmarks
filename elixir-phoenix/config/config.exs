# This file is responsible for configuring your application
use Mix.Config

# Note this file is loaded before any dependency and is restricted
# to this project. If another project depends on this project, this
# file won't be loaded nor affect the parent project.

config :phoenix, ElixirPhoenix.Router,
  port: System.get_env("PORT"),
  ssl: false,
  code_reload: false,
  static_assets: true,
  cookies: true,
  session_key: "_elixir_phoenix_key",
  session_secret: "^(%X4=8N@PMEBTC)$I0Z4DCKI249XPJYK*)D@OZ@VI@HH86=!TSW1K1ZRJLL5SU1$V1KLM"

config :phoenix, :logger,
  level: :error


# Import environment specific config. Note, this must remain at the bottom of
# this file to properly merge your previous config entries.
import_config "#{Mix.env}.exs"
