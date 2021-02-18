defmodule CreditLimitApiWeb.Router do
  use CreditLimitApiWeb, :router

  pipeline :api do
    plug :accepts, ["json"]
  end

  scope "/api", CreditLimitApiWeb do
    pipe_through :api
    
    resources "/lots", LotController, only: [:index, :show]
  end
  
  pipeline :browser do
    plug(:accepts, ["html"])
  end
  
  if Mix.env() in [:dev, :test] do
    import Phoenix.LiveDashboard.Router
    
    scope "/" do
      pipe_through [:fetch_session, :protect_from_forgery, :browser]
      live_dashboard "/dashboard", metrics: CreditLimitApiWeb.Telemetry
      get "/", DefaultController, :index    
    end
  end
end
