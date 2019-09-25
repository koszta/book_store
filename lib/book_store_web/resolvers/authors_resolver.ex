defmodule BookStoreWeb.AuthorsResolver do
  alias BookStore.Repo
  alias BookStore.Books.Book

  def find(%Book{} = book, _args, _info) do
    {:ok,
     book
     |> Ecto.assoc(:author)
     |> Repo.one()}
  end
end
