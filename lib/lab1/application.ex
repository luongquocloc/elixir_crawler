defmodule Lab1.Application do
  # See https://hexdocs.pm/elixir/Application.html
  # for more information on OTP Applications
  @moduledoc false

  use Application

  def start(_type, _args) do
    import Supervisor.Spec
    # List all child processes to be supervised
    children = [
      # Start the Ecto repository
      Lab1.Repo,
      Crawler.client_spec(),
      # Start the endpoint when the application starts
      Lab1Web.Endpoint
      # Starts a worker by calling: Lab1.Worker.start_link(arg)
      # {Lab1.Worker, arg},
    ]

    # See https://hexdocs.pm/elixir/Supervisor.html
    # for other strategies and supported options
    opts = [strategy: :one_for_one, name: Lab1.Supervisor]
    Supervisor.start_link(children, opts)
  end

  # Tell Phoenix to update the endpoint configuration
  # whenever the application is updated.
  def config_change(changed, _new, removed) do
    Lab1Web.Endpoint.config_change(changed, removed)
    :ok
  end
end
