defmodule CreditLimitApi.Model.Lot do
  use Ecto.Schema
  import Ecto.Changeset

  schema "lots" do
    field :agreement_name, :string

    has_many :solicitations, Solicitation
    
    timestamps(inserted_at: :created_at)
  end

  @doc false
  def changeset(log, attrs) do
    log
    |> cast(attrs, [:agreement_name, :lot_id])
    |> validate_required([:agreement_name, :lot_id])
  end
end
