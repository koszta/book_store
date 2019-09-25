defmodule BookStore.Books.Book do
  use Ecto.Schema
  import Ecto.Changeset
  alias BookStore.Authors.Author

  schema "books" do
    field(:description, :string)
    field(:isbn, :string)
    field(:pages, :integer)
    field(:price, :float)
    field(:title, :string)

    belongs_to(:author, Author)

    timestamps()
  end

  @doc false
  def changeset(book, attrs) do
    book
    |> cast(attrs, [:title, :description, :pages, :price, :isbn])
    |> validate_required([:title, :description, :pages, :price, :isbn])
  end
end
