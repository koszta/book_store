defmodule BookStoreWeb.Schema do
  use Absinthe.Schema

  object :book do
    field(:id, :id)
    field(:title, :string)
    field(:author, :string)
    field(:description, :string)
    field(:pages, :integer)
    field(:price, :float)
    field(:isbn, :string)
  end

  query do
    field(:books, list_of(:book))
  end
end
