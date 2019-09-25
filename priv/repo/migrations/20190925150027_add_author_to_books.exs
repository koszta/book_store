defmodule BookStore.Repo.Migrations.AddAuthorToBooks do
  use Ecto.Migration

  def change do
    alter table("books") do
      remove(:author)
      add(:author_id, references(:authors))
    end
  end
end
