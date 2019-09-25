defmodule BookStoreWeb.Schema do
  use Absinthe.Schema
  alias BookStoreWeb.BooksResolver

  import_types(Absinthe.Type.Custom)

  object :author do
    field(:first_name, :string)
    field(:last_name, :string)
    field(:date_of_birth, :date)
  end

  object :book do
    field(:id, :id)
    field(:title, :string)
    field(:author, :author)
    field(:description, :string)
    field(:pages, :integer)
    field(:price, :float)
    field(:isbn, :string)
  end

  query do
    field :books, list_of(:book) do
      resolve(&BooksResolver.all/3)
    end
  end
end
