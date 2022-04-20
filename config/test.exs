import Config

# Configure your database
#
# The MIX_TEST_PARTITION environment variable can be used
# to provide built-in test partitioning in CI environment.
# Run `mix help test` for more information.
config :mango, Mango.Repo,
  username: "postgres",
  password: "root",
  hostname: "localhost",
  database: "mango_test#{System.get_env("MIX_TEST_PARTITION")}",
  pool: Ecto.Adapters.SQL.Sandbox,
  pool_size: 10

# We don't run a server during test. If one is required,
# you can enable the server option below.
config :mango, MangoWeb.Endpoint,
  http: [ip: {127, 0, 0, 1}, port: 4001],
  secret_key_base: "RhBkZJ2OK+hyDkgoIUmLom/N4Fb6G1P4+VIrNBbeyUXuxsFYa+VbpXoi+0bx5JC3",
  server: true

config :hound, driver: "phantomjs"
# In test we don't send emails.
config :mango, Mango.Mailer, adapter: Swoosh.Adapters.Test

# Print only warnings and errors during test
config :logger, level: :warn

# Initialize plugs at runtime for faster test compilation
config :phoenix, :plug_init_mode, :runtime
