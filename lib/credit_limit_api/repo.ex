defmodule CreditLimitApi.Repo do
  use Ecto.Repo,
    otp_app: :credit_limit_api,
    adapter: Ecto.Adapters.Postgres
end
