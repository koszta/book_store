defmodule BookStoreWeb.Loaders.BookStoreLoader do
  alias BookStore.Authors.Author
  alias BookStore.Books.Book
  alias BookStore.Repo
  alias Dataloader.Ecto

  def data do
    Ecto.new(Repo, query: &query/2)
  end

  def query(Author, _) do
    Author
  end

  def query(Book, _) do
    Book
  end
end
