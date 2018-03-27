defmodule BookStore.Books.Book do
  use Ecto.Schema
  import Ecto.Changeset


  schema "books" do
    field :author, :string
    field :description, :string
    field :isbn, :string
    field :pages, :integer
    field :price, :float
    field :title, :string

    timestamps()
  end

  @doc false
  def changeset(book, attrs) do
    book
    |> cast(attrs, [:title, :author, :description, :pages, :price, :isbn])
    |> validate_required([:title, :author, :description, :pages, :price, :isbn])
  end
end
