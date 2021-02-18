defmodule CreditLimitApi.Application do
  # See https://hexdocs.pm/elixir/Application.html
  # for more information on OTP Applications
  @moduledoc false

  use Application

  def start(_type, _args) do
    children = [
      # Start the Ecto repository
      CreditLimitApi.Repo,
      # Start the Telemetry supervisor
      CreditLimitApiWeb.Telemetry,
      # Start the PubSub system
      {Phoenix.PubSub, name: CreditLimitApi.PubSub},
      # Start the Endpoint (http/https)
      CreditLimitApiWeb.Endpoint
      # Start a worker by calling: CreditLimitApi.Worker.start_link(arg)
      # {CreditLimitApi.Worker, arg}
    ]

    # See https://hexdocs.pm/elixir/Supervisor.html
    # for other strategies and supported options
    opts = [strategy: :one_for_one, name: CreditLimitApi.Supervisor]
    Supervisor.start_link(children, opts)
  end

  # Tell Phoenix to update the endpoint configuration
  # whenever the application is updated.
  def config_change(changed, _new, removed) do
    CreditLimitApiWeb.Endpoint.config_change(changed, removed)
    :ok
  end
end
