defmodule Homework.Repo.Migrations.CompaniesAlterCreditLineTypeAndRemoveAvailabeCredit do
  use Ecto.Migration

  def change do
    alter table(:companies) do
      modify :credit_line, :int
      remove(:available_credit)
    end

  end
end
