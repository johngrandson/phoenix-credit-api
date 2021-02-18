defmodule CreditLimitApiWeb.LotView do
  use CreditLimitApiWeb, :view
  alias CreditLimitApiWeb.LotView

  def render("index.json", %{lots: lots}) do
    %{data: render_many(lots, LotView, "data.json")}
  end

  def render("show.json", %{lot: lot}) do
    %{data: render_one(lot, LotView, "solicitations.json")}
  end

  def render("data.json", %{lot: lot}) do
    %{
      # lot_id: lot.id,
      # agreement_name: lot.agreement_name,
      solicitations: render_many(lot.solicitations, LotView, "solicitations.json"),
      # created_at: lot.created_at,
      # updated_at: lot.updated_at
    }
  end

  def render("solicitations.json", %{sol: sol}) do
    %{
      status: sol.status,
      message: sol.message,
      customer: sol.customer,
      document: sol.document,
      created_at: sol.created_at,
      updated_at: sol.updated_at
    }
  end
end
