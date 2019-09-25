# Script for populating the database. You can run it as:
#
#     mix run priv/repo/seeds.exs
#
# Inside the script, you can read and write to any of your
# repositories directly:
#
#     BookStore.Repo.insert!(%BookStore.SomeSchema{})
#
# We recommend using the bang functions (`insert!`, `update!`
# and so on) as they will fail if something goes wrong.

alias BookStore.Repo
alias BookStore.Books.Book
alias BookStore.Authors.Author

Repo.insert!(%Book{
  title: "Things that I can not do",
  author: %Author{
    first_name: "Chuck",
    last_name: "Norris",
    date_of_birth: ~D[1940-03-10]
  },
  description: "This book contains so far the greatest collection of things that I can not do.",
  pages: 0,
  price: 22.01,
  isbn: "9786543210984"
})

Repo.insert!(%Book{
  title: "Chest hair as evolutional advantage",
  author: %Author{
    first_name: "David",
    last_name: "Hasselhoff",
    date_of_birth: ~D[1952-07-17]
  },
  description: "A bulletproof chest hair is an essental accessoire of the modern man.",
  pages: 120,
  price: 12.99,
  isbn: "9786543210991"
})
