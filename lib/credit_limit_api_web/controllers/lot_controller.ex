defmodule CreditLimitApiWeb.LotController do
  use CreditLimitApiWeb, :controller

  alias CreditLimitApi.Service
  alias CreditLimitApi.Model

  action_fallback CreditLimitApiWeb.FallbackController

  def index(conn, _params) do
    lots = Service.Lot.list_lots()
    render(conn, "index.json", lots: lots)
  end

  def show(conn, %{"id" => id}) do
    lot = Service.Lot.get_lot!(id)
    render(conn, "show.json", lot: lot)
  end

  def create(conn, %{"lot" => lot_params}) do
    with {:ok, %Model.Lot{} = lot} <- Service.Lot.create_lot(lot_params) do
      conn
      |> put_status(:created)
      |> put_resp_header("location", Routes.lot_path(conn, :show, lot))
      |> render("show.json", lot: lot)
    end
  end

  def update(conn, %{"id" => id, "lot" => lot_params}) do
    lot = Service.Lot.get_lot!(id)

    with {:ok, %Model.Lot{} = lot} <- Service.Lot.update_lot(lot, lot_params) do
      render(conn, "show.json", lot: lot)
    end
  end

  def delete(conn, %{"id" => id}) do
    lot = Service.Lot.get_lot!(id)

    with {:ok, %Model.Lot{}} <- Service.Lot.delete_lot(lot) do
      send_resp(conn, :no_content, "")
    end
  end
end
