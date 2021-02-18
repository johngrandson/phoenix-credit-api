defmodule CreditLimitApiWeb.DefaultController do
  use CreditLimitApiWeb, :controller

  def index(conn, _params) do
    text conn, "Credit Limit API working!"
  end
end