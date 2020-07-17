defmodule PheedThePi.PythonServer do
  @moduledoc """
  GenServer which manages the Python erlang port.
  """

  use GenServer
  alias PheedThePi.PythonConnection, as: Python

  def start_link(_), do:
    GenServer.start_link(__MODULE__, nil, name: __MODULE__)

  def init(_) do
    # Get the pid of the python session.
    python_session = Python.start()
    # Start the connection to the python session.
    Python.call(python_session, :api, :register_handler, [self()])
    {:ok, python_session}
  end

  @spec cast_function(atom(), list(any())) :: :ok
  def cast_function(function, arguments), do:
    GenServer.cast(__MODULE__, {function, arguments})

  @spec send_message(any) :: :ok
  def send_message(message), do:
    GenServer.cast(__MODULE__, {:python_message, message})

  def handle_cast({:python_message, message}, python_session) do
    Python.cast(python_session, message)
    {:noreply, python_session}
  end

  def handle_cast({function, arguments}, python_session) do
    Python.call(python_session, :api, function, arguments)
    {:noreply, python_session}
  end

  def terminate(_reason, python_session) do
    Python.stop(python_session)
  end

end
