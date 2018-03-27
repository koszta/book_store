defmodule BookStore.BooksTest do
  use BookStore.DataCase

  alias BookStore.Books

  describe "books" do
    alias BookStore.Books.Book

    @valid_attrs %{author: "some author", description: "some description", isbn: "some isbn", pages: 42, price: 120.5, title: "some title"}
    @update_attrs %{author: "some updated author", description: "some updated description", isbn: "some updated isbn", pages: 43, price: 456.7, title: "some updated title"}
    @invalid_attrs %{author: nil, description: nil, isbn: nil, pages: nil, price: nil, title: nil}

    def book_fixture(attrs \\ %{}) do
      {:ok, book} =
        attrs
        |> Enum.into(@valid_attrs)
        |> Books.create_book()

      book
    end

    test "list_books/0 returns all books" do
      book = book_fixture()
      assert Books.list_books() == [book]
    end

    test "get_book!/1 returns the book with given id" do
      book = book_fixture()
      assert Books.get_book!(book.id) == book
    end

    test "create_book/1 with valid data creates a book" do
      assert {:ok, %Book{} = book} = Books.create_book(@valid_attrs)
      assert book.author == "some author"
      assert book.description == "some description"
      assert book.isbn == "some isbn"
      assert book.pages == 42
      assert book.price == 120.5
      assert book.title == "some title"
    end

    test "create_book/1 with invalid data returns error changeset" do
      assert {:error, %Ecto.Changeset{}} = Books.create_book(@invalid_attrs)
    end

    test "update_book/2 with valid data updates the book" do
      book = book_fixture()
      assert {:ok, book} = Books.update_book(book, @update_attrs)
      assert %Book{} = book
      assert book.author == "some updated author"
      assert book.description == "some updated description"
      assert book.isbn == "some updated isbn"
      assert book.pages == 43
      assert book.price == 456.7
      assert book.title == "some updated title"
    end

    test "update_book/2 with invalid data returns error changeset" do
      book = book_fixture()
      assert {:error, %Ecto.Changeset{}} = Books.update_book(book, @invalid_attrs)
      assert book == Books.get_book!(book.id)
    end

    test "delete_book/1 deletes the book" do
      book = book_fixture()
      assert {:ok, %Book{}} = Books.delete_book(book)
      assert_raise Ecto.NoResultsError, fn -> Books.get_book!(book.id) end
    end

    test "change_book/1 returns a book changeset" do
      book = book_fixture()
      assert %Ecto.Changeset{} = Books.change_book(book)
    end
  end
end
