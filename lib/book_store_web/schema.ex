defmodule BookStoreWeb.Schema do
  use Absinthe.Schema
  import Absinthe.Resolution.Helpers, only: [dataloader: 1]
  alias BookStoreWeb.AuthorsResolver
  alias BookStoreWeb.BooksResolver
  alias BookStoreWeb.Loaders.BookStoreLoader

  def context(ctx) do
    loader =
      Dataloader.new()
      |> Dataloader.add_source(BookStoreLoader, BookStoreLoader.data())

    Map.put(ctx, :loader, loader)
  end

  def plugins do
    [Absinthe.Middleware.Dataloader] ++ Absinthe.Plugin.defaults()
  end

  import_types(Absinthe.Type.Custom)

  object :author do
    field(:first_name, :string)
    field(:last_name, :string)
    field(:date_of_birth, :date)
  end

  object :book do
    field(:id, :id)
    field(:title, :string)
    field(:author, :author, resolve: dataloader(BookStoreLoader))
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
