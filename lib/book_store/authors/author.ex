defmodule BookStore.Authors.Author do
  use Ecto.Schema
  import Ecto.Changeset


  schema "authors" do
    field :date_of_birth, :date
    field :first_name, :string
    field :last_name, :string

    timestamps()
  end

  @doc false
  def changeset(author, attrs) do
    author
    |> cast(attrs, [:first_name, :last_name, :date_of_birth])
    |> validate_required([:first_name, :last_name, :date_of_birth])
  end
end
