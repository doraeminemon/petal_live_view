defmodule PetalLiveViewWeb.LicenseLive do
  use PetalLiveViewWeb, :live_view

  alias PetalLiveView.Licenses
  import Number.Currency

  def mount(_params, _session, socket) do
    expiration_time = Timex.shift(Timex.now(), hours: 1)
    if connected?(socket) do
      :timer.send_interval(1000, self(), :tick)
    end
    socket = assign(
      socket,
      seats: 2,
      amount: Licenses.calculate(2),
      time_remaining: expiration_time |> time_remaining(),
      expiration_time: expiration_time |> Timex.format!("{RFC3339}"),
    )
    {:ok, socket}
  end

  def render(assigns) do
    ~L"""
    <h1> Licenses </h1>
    <div id="license">
      <div class="card">
        <div class="content">
          <div class="seats">
            <img src="images/license.svg">
            <span>
              Your license is currently for
              <strong><%= @seats %> seats. </strong>
            </span>
          </div>

          <form phx-change="update">
            <input type="range" min="1" max="10" name="seats" value="<%= @seats %>"/>
          </form>

          <div class="amount">
            <%= number_to_currency(@amount) %>
          </div>
        </div>

        <div class="countdown-timer">
          <%= if @time_remaining > 0 do %>
            <h2>Quick, there are only <%= format_time(@time_remaining) %> left before the deal expire </h2>
          <% else %>
            Expired
          <% end %>
        </div>
      </div>
    </div>
    """
  end

  def handle_info(:tick, socket) do
    new_time_formatted = socket.assigns.expiration_time
    |> Timex.parse!("{RFC3339}")
    |> time_remaining()

    socket = assign(socket, time_remaining: new_time_formatted)

    {:noreply, socket}
  end

  def handle_event("update", %{"seats" => seats}, socket) do
    seats = String.to_integer(seats)
    socket = assign(
      socket,
      seats: seats,
      amount: Licenses.calculate(seats))
    {:noreply, socket}
  end

  defp time_remaining(expiration_time) do
    DateTime.diff(expiration_time, Timex.now())
  end

  defp format_time(time) do
    time
    |> Timex.Duration.from_seconds()
    |> Timex.format_duration(:humanized)
  end
end
