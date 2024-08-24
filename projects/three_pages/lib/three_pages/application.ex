defmodule ThreePages.Application do
  # See https://hexdocs.pm/elixir/Application.html
  # for more information on OTP Applications
  @moduledoc false

  use Application

  @impl true
  def start(_type, _args) do
    children = [
      ThreePagesWeb.Telemetry,
      {DNSCluster, query: Application.get_env(:three_pages, :dns_cluster_query) || :ignore},
      {Phoenix.PubSub, name: ThreePages.PubSub},
      # Start the Finch HTTP client for sending emails
      {Finch, name: ThreePages.Finch},
      # Start a worker by calling: ThreePages.Worker.start_link(arg)
      # {ThreePages.Worker, arg},
      # Start to serve requests, typically the last entry
      ThreePagesWeb.Endpoint
    ]

    # See https://hexdocs.pm/elixir/Supervisor.html
    # for other strategies and supported options
    opts = [strategy: :one_for_one, name: ThreePages.Supervisor]
    Supervisor.start_link(children, opts)
  end

  # Tell Phoenix to update the endpoint configuration
  # whenever the application is updated.
  @impl true
  def config_change(changed, _new, removed) do
    ThreePagesWeb.Endpoint.config_change(changed, removed)
    :ok
  end
end
