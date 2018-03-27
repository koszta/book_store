defmodule BookStoreWeb.BooksResolver do
  alias BookStore.Books

  def all(_root, _args, _info) do
    {:ok, Books.list_books()}
  end
end
