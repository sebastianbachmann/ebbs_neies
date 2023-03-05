defmodule EbbsNeies.Application do
  # See https://hexdocs.pm/elixir/Application.html
  # for more information on OTP Applications
  @moduledoc false

  use Application

  @impl true
  def start(_type, _args) do
    children = [
      # Start the Telemetry supervisor
      EbbsNeiesWeb.Telemetry,
      # Start the Ecto repository
      EbbsNeies.Repo,
      # Start the PubSub system
      {Phoenix.PubSub, name: EbbsNeies.PubSub},
      # Start Finch
      {Finch, name: EbbsNeies.Finch},
      # Start the Endpoint (http/https)
      EbbsNeiesWeb.Endpoint
      # Start a worker by calling: EbbsNeies.Worker.start_link(arg)
      # {EbbsNeies.Worker, arg}
    ]

    # See https://hexdocs.pm/elixir/Supervisor.html
    # for other strategies and supported options
    opts = [strategy: :one_for_one, name: EbbsNeies.Supervisor]
    Supervisor.start_link(children, opts)
  end

  # Tell Phoenix to update the endpoint configuration
  # whenever the application is updated.
  @impl true
  def config_change(changed, _new, removed) do
    EbbsNeiesWeb.Endpoint.config_change(changed, removed)
    :ok
  end
end
