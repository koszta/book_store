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

  @books [
    %{
      id: 1,
      title: "Things that I can not do",
      author: "Chuck Norris",
      description:
        "This book contains so far the greatest collection of things that I can not do.",
      pages: 0,
      price: 22.01,
      isbn: "9786543210984"
    },
    %{
      id: 2,
      title: "Chest hair as evolutional advantage",
      author: "David Hasselhoff",
      description: "A bulletproof chest hair is an essental accessoire of the modern man.",
      pages: 120,
      price: 12.99,
      isbn: "9786543210991"
    }
  ]

  query do
    field :books, list_of(:book) do
      resolve(fn _args, _info ->
        {:ok, @books}
      end)
    end
  end
end
