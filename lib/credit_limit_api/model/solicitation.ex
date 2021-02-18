defmodule CreditLimitApi.Model.Solicitation do
  use Ecto.Schema
  import Ecto.Changeset

  schema "solicitations" do
    field :status, :string
    field :message, :string
    field :customer, :string
    field :document, :string

    belongs_to :lot, Lot

    timestamps(inserted_at: :created_at)
  end

  @doc false
  def changeset(solicitation, attrs) do
    solicitation
    |> cast(attrs, [:lot_id, :status, :message, :customer, :document])
    |> validate_required([:lot_id, :status, :message, :customer, :document])
  end
end
