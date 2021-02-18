defmodule CreditLimitApi.Service.Solicitation do
  alias CreditLimitApi.Repo
  alias CreditLimitApi.Model.Solicitation

  def list_solicitations do
    Repo.all(Solicitation)
  end

  def get_solicitation!(id), do: Repo.get!(Solicitation, id)

  def create_solicitation(attrs \\ %{}) do
    %Solicitation{}
    |> Solicitation.changeset(attrs)
    |> Repo.insert()
  end

  def update_solicitation(%Solicitation{} = solicitation, attrs) do
    solicitation
    |> Solicitation.changeset(attrs)
    |> Repo.update()
  end

  def delete_solicitation(%Solicitation{} = solicitation) do
    Repo.delete(solicitation)
  end

  def change_solicitation(%Solicitation{} = solicitation, attrs \\ %{}) do
    Solicitation.changeset(solicitation, attrs)
  end
end
