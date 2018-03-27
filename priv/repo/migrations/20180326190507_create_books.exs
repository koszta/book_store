defmodule BookStore.Repo.Migrations.CreateBooks do
  use Ecto.Migration

  def change do
    create table(:books) do
      add :title, :string
      add :author, :string
      add :description, :text
      add :pages, :integer
      add :price, :float
      add :isbn, :string

      timestamps()
    end

  end
end
