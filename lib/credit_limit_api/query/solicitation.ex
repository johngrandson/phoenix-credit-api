defmodule CreditLimitApi.Query.Solicitation do
  import Ecto.Query

  alias CreditLimitApi.Model
    
  def solicitation_by_id(query, id) do
    from s in Model.Solicitation,
    where: s.lot_id == ^id,
    select: %{
      solicitations: map(s, [:id, :lot_id, :status, :message, :customer, :document, :created_at, :updated_at]),
    }
  end
end