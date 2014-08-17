use Mix.Config

config :phoenix, ElixirPhoenix.Router,
  port: System.get_env("PORT"),
  ssl: false,
  host: "example.com",
  code_reload: false,
  cookies: true,
  session_key: "_elixir_phoenix_key",
  session_secret: "^(%X4=8N@PMEBTC)$I0Z4DCKI249XPJYK*)D@OZ@VI@HH86=!TSW1K1ZRJLL5SU1$V1KLM"

config :phoenix, :logger,
  level: :error

