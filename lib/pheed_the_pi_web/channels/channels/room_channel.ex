defmodule PheedThePiWeb.RoomChannel do
  use Phoenix.Channel

  def join("room:main", _message, socket) do
    {:ok, socket}
  end

  def handle_in("button:press", %{"message" => button}, socket) do
    IO.write "Pressed button #{button}"
    {:noreply, socket}
  end

  def handle_in("button:release", %{"message" => button}, socket) do
    IO.write "Released button #{button}"
    {:noreply, socket}
  end
end
