defmodule CreditLimitApi.Query.Lot do
  import Ecto.Query

  alias CreditLimitApi.Model

  def lot_by_id(query, id) do
    from l in query,
    where: l.id == ^id,
    select: %{
      id: l.id,
      agreement_name: l.agreement_name,
      created_at: l.created_at,
      updated_at: l.updated_at,
    }
  end
end