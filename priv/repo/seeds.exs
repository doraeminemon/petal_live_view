# Script for populating the database. You can run it as:
#
#     mix run priv/repo/seeds.exs
#
# Inside the script, you can read and write to any of your
# repositories directly:
#
#     PetalLiveView.Repo.insert!(%PetalLiveView.SomeSchema{})
#
# We recommend using the bang functions (`insert!`, `update!`
# and so on) as they will fail if something goes wrong.

alias PetalLiveView.Repo
alias PetalLiveView.Boats.Boat

%Boat{
  models: "1760 Retriever Jon Deluxe",
  price: "$",
  type: "fishing",
  image: "/images/boats/1760-retriever-jon-deluxe.jpg"
}
|> Repo.insert!()

%Boat{
  models: "1650 Super Hawk",
  price: "$",
  type: "fishing",
  image: "/images/boats/1650-super-hawk.jpg"
}
|> Repo.insert!()

%Boat{
  models: "1850 Super Hawk",
  price: "$$",
  type: "fishing",
  image: "/images/boats/1850-super-hawk.jpg"
}
|> Repo.insert!()

%Boat{
  models: "1950 Super Hawk",
  price: "$$",
  type: "fishing",
  image: "/images/boats/1950-super-hawk.jpg"
}
|> Repo.insert!()

%Boat{
  models: "2050 Authority",
  price: "$$$",
  type: "fishing",
  image: "/images/boats/2050-authority.jpg"
}
|> Repo.insert!()

%Boat{
  models: "Deep Sea Elite",
  price: "$$$",
  type: "fishing",
  image: "/images/boats/deep-sea-elite.jpg"
}
|> Repo.insert!()

%Boat{
  models: "Beneteau First 14",
  price: "$$",
  type: "sailing",
  image: "/images/boats/beneteau-first-14.jpg"
}
|> Repo.insert!()

%Boat{
  models: "Beneteau First 24",
  price: "$$$",
  type: "sailing",
  image: "/images/boats/beneteau-first-24.jpg"
}
|> Repo.insert!()

%Boat{
  models: "Beneteau Oceanis 31",
  price: "$$$",
  type: "sailing",
  image: "/images/boats/beneteau-oceanis-31.jpg"
}
|> Repo.insert!()

%Boat{
  models: "RS Quest",
  price: "$",
  type: "sailing",
  image: "/images/boats/rs-quest.jpg"
}
|> Repo.insert!()

%Boat{
  models: "RS Feva",
  price: "$",
  type: "sailing",
  image: "/images/boats/rs-feva.jpg"
}
|> Repo.insert!()

%Boat{
  models: "RS Cat 16",
  price: "$$",
  type: "sailing",
  image: "/images/boats/rs-cat-16.jpg"
}
|> Repo.insert!()

%Boat{
  models: "Yamaha SX190",
  price: "$",
  type: "sporting",
  image: "/images/boats/yamaha-sx190.jpg"
}
|> Repo.insert!()

%Boat{
  models: "Yamaha 212X",
  price: "$$",
  type: "sporting",
  image: "/images/boats/yamaha-212x.jpg"
}
|> Repo.insert!()

%Boat{
  models: "Glastron GT180",
  price: "$",
  type: "sporting",
  image: "/images/boats/glastron-gt180.jpg"
}
|> Repo.insert!()

%Boat{
  models: "Glastron GT225",
  price: "$$",
  type: "sporting",
  image: "/images/boats/glastron-gt225.jpg"
}
|> Repo.insert!()

%Boat{
  models: "Yamaha 275E",
  price: "$$$",
  type: "sporting",
  image: "/images/boats/yamaha-275e.jpg"
}
|> Repo.insert!()

%Boat{
  models: "Yamaha 275SD",
  price: "$$$",
  type: "sporting",
  image: "/images/boats/yamaha-275sd.jpg"
}
|> Repo.insert!()
