defmodule PetalLiveView.Repo do
  use Ecto.Repo,
    otp_app: :petal_live_view,
    adapter: Ecto.Adapters.Postgres
end
