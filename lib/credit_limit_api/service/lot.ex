defmodule CreditLimitApi.Service.Lot do
  alias CreditLimitApi.Repo
  alias CreditLimitApi.Model
  alias CreditLimitApi.Query

  def list_lots do
    Model.Lot
    |> Repo.all()
  end

  def get_lot!(id) do
    Model.Lot
    # |> Query.Lot.lot_by_id(id)
    |> Query.Solicitation.solicitation_by_id(id)
    |> Repo.all()
    |> List.first()
  end

  def create_lot(attrs \\ %{}) do
    %Model.Lot{}
    |> Model.Lot.changeset(attrs)
    |> Repo.insert()
  end

  def update_lot(%Model.Lot{} = lot, attrs) do
    lot
    |> Model.Lot.changeset(attrs)
    |> Repo.update()
  end

  def delete_lot(%Model.Lot{} = lot) do
    Repo.delete(lot)
  end

  def change_lot(%Model.Lot{} = lot, attrs \\ %{}) do
    Model.Lot.changeset(lot, attrs)
  end
end
