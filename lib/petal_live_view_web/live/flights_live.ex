defmodule PetalLiveViewWeb.FlightsLive do
  use PetalLiveViewWeb, :live_view
  alias PetalLiveView.Flights
  alias PetalLiveView.Airports

  def mount(_, _session, socket) do
    socket = assign(socket,
      loading: false,
      flights: [],
      number: "",
      airport: "",
      matches: []
    )

    {:ok, socket}
  end

  def render(assigns) do
    ~L"""
    <h1>Find a Flight</h1>
    <div id="search">

      <form phx-submit="number-search">
        <input
          type="text"
          name="flight-number"
          value="<%= @number %>"
          placeholder="Flight Number"
          autofocus
          autocomplete="off"
          <%= if @loading, do: "readonly" %>
        />
        <button type="submit">
          <img src="images/search.svg">
        </button>
      </form>

      <form phx-submit="airport-search" phx-change="airport-suggest">
        <input
          type="text"
          name="airport"
          value="<%= @airport %>"
          placeholder="Airport"
          autofocus
          autocomplete="off"
          list="matches"
          phx-debounce="1000"
          <%= if @loading, do: "readonly" %>
        />
        <button type="submit">
          <img src="images/search.svg">
        </button>
      </form>

      <datalist id="matches">
        <%= for match <- @matches do %>
          <option value="<%= match %>"><%= match %></option>
        <% end %>
      </datalist>

      <%= if @loading do %>
        <div class="loader">Loading...</div>
      <% end %>

      <div class="flights">
        <ul>
          <%= for flight <- @flights do %>
            <li>
              <div class="first-line">
                <div class="number">
                  Flight #<%= flight.number %>
                </div>
                <div class="origin-destination">
                  <img src="images/location.svg">
                  <%= flight.origin %> to
                  <%= flight.destination %>
                </div>
              </div>
              <div class="second-line">
                <div class="departs">
                  Departs: <%= format_time(flight.departure_time) %>
                </div>
                <div class="arrives">
                  Arrives: <%= format_time(flight.arrival_time) %>
                </div>
              </div>
            </li>
          <% end %>
        </ul>
      </div>
    </div>
    """
  end

  defp format_time(time) do
    Timex.format!(time, "%b %d at %H:%M", :strftime)
  end

  def handle_event("airport-suggest", %{"airport" => prefix}, socket) do
    socket = assign(socket, matches: Airports.suggest(prefix))
    {:noreply, socket}
  end

  def handle_event("airport-search", %{"airport" => airport}, socket) do
    airport |> IO.inspect()
    send(self(), {:run_airport_search, airport})
    socket = assign(socket, loading: true)
    {:noreply, socket}
  end

  def handle_event("number-search", %{"flight-number" => number}, socket) do
    send(self(), {:run_flight_search, number})
    socket = assign(
      socket,
      loading: true,
      number: number,
      flights: []
    )

    {:noreply, socket}
  end

  def handle_info({:run_flight_search, number}, socket) do
    case Flights.search_by_number(number) do
      [] ->
        socket = socket
        |> put_flash(:info, "No flights")
        |> assign(loading: false, flights: [])
        {:noreply, socket}
      flights ->
        socket = socket
        |> clear_flash()
        |> assign(loading: false, flights: flights)
        {:noreply, socket}
    end
  end

  def handle_info({:run_airport_search, airport}, socket) do
    airport |> IO.inspect()
    case Flights.search_by_airport(airport) do
      [] ->
        socket = socket
        |> put_flash(:info, "no airport")
        |> assign(loading: false, flights: [])
        {:noreply, socket}
      flights ->
        socket = socket
        |> clear_flash()
        |> assign(loading: false, flights: flights)
        {:noreply, socket}
    end
  end
end
