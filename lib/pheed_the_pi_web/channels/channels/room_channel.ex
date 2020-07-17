defmodule PheedThePiWeb.RoomChannel do
  use Phoenix.Channel

  alias PheedThePi.PythonManager, as: Python

  def join("room:main", _message, socket) do
    {:ok, socket}
  end

  def handle_in("button:press", %{"message" => button}, socket) do
    Python.message "Pressed button #{button}"
    {:noreply, socket}
  end

  def handle_in("button:release", %{"message" => button}, socket) do
    Python.message "Released button #{button}"
    {:noreply, socket}
  end
end
