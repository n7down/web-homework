defmodule Homework.Repo.Migrations.TransactionsAddCompanyIdColumn do
  use Ecto.Migration

  def change do
    alter table(:transactions) do
      add(:company_id, references(:companies, type: :uuid, on_delete: :nothing))
    end
  end
end
