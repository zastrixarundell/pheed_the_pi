defmodule PheedThePiWeb.RoomChannel do
  use Phoenix.Channel

  def join("room:main", _message, socket) do
    {:ok, socket}
  end

  def handle_in("button:press", %{"message" => button}, socket) do
    IO.inspect "Pressed button #{button}", label: "socket-button-press"
    {:noreply, socket}
  end

  def handle_in("button:release", %{"message" => button}, socket) do
    IO.inspect "Released button #{button}", label: "socket-button-release"
    {:noreply, socket}
  end
end
