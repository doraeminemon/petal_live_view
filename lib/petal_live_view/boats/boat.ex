defmodule PetalLiveView.Boats.Boat do
  use Ecto.Schema
  import Ecto.Changeset

  schema "boats" do
    field :image, :string
    field :models, :string
    field :price, :string
    field :type, :string

    timestamps()
  end

  @doc false
  def changeset(boat, attrs) do
    boat
    |> cast(attrs, [:models, :type, :price, :image])
    |> validate_required([:models, :type, :price, :image])
  end
end
