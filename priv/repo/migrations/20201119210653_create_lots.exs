defmodule CreditLimitApi.Repo.Migrations.CreateLots do
  use Ecto.Migration

  def change do
    create table(:lots) do
      add :agreement_name, :string

      timestamps(inserted_at: :created_at)
    end
  end
end
