defmodule CreditLimitApi.Repo.Migrations.CreateSolicitations do
  use Ecto.Migration

  def change do
    create table(:solicitations) do
      add :status, :string
      add :message, :string
      add :customer, :string
      add :document, :string
      add :lot_id, references(:lots)

      timestamps(inserted_at: :created_at)
    end
  end
end
