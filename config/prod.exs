use Mix.Config

# For production, we configure the host to read the PORT
# from the system environment. Therefore, you will need
# to set PORT=80 before running your server.
#
# You should also configure the url host to something
# meaningful, we use this information when generating URLs.
#
# Finally, we also include the path to a manifest
# containing the digested version of static files. This
# manifest is generated by the mix phoenix.digest task
# which you typically run after static files are built.
config :digitalocean_connector, DigitalOceanConnector.Endpoint,
  http: [port: {:system, "PORT"}],
  url: [scheme: "https", host: "addon-digitalocean-connector.herokuapp.com", port: 443],
  force_ssl: [rewrite_on: [:x_forwarded_proto]],
  cache_static_manifest: "priv/static/manifest.json",
  secret_key_base: System.get_env("SECRET_KEY_BASE")

# Do not print debug messages in production
config :logger, level: :info

# Configure 3rd parties
config :digitalocean_connector,
  dnsimple_client_id: System.get_env("DNSIMPLE_CLIENT_ID"),
  dnsimple_client_secret: System.get_env("DNSIMPLE_CLIENT_SECRET"),
  digitalocean_client_id: System.get_env("DIGITALOCEAN_CLIENT_ID"),
  digitalocean_callback_url: System.get_env("DIGITALOCEAN_CALLBACK"),
  digitalocean_client_secret: System.get_env("DIGITALOCEAN_CLIENT_SECRET")

# ## SSL Support
#
# To get SSL working, you will need to add the `https` key
# to the previous section and set your `:url` port to 443:
#
#     config :digitalocean_connector, DigitalOceanConnector.Endpoint,
#       ...
#       url: [host: "example.com", port: 443],
#       https: [port: 443,
#               keyfile: System.get_env("SOME_APP_SSL_KEY_PATH"),
#               certfile: System.get_env("SOME_APP_SSL_CERT_PATH")]
#
# Where those two env variables return an absolute path to
# the key and cert in disk or a relative path inside priv,
# for example "priv/ssl/server.key".
#
# We also recommend setting `force_ssl`, ensuring no data is
# ever sent via http, always redirecting to https:
#
#     config :digitalocean_connector, DigitalOceanConnector.Endpoint,
#       force_ssl: [hsts: true]
#
# Check `Plug.SSL` for all available options in `force_ssl`.

# ## Using releases
#
# If you are doing OTP releases, you need to instruct Phoenix
# to start the server for all endpoints:
#
#     config :phoenix, :serve_endpoints, true
#
# Alternatively, you can configure exactly which server to
# start per endpoint:
#
#     config :digitalocean_connector, DigitalOceanConnector.Endpoint, server: true
#
