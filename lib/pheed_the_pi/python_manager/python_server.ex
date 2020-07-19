defmodule PheedThePi.PythonServer do
  @moduledoc """
  GenServer which manages the Python erlang port.
  """

  use GenServer
  alias PheedThePi.PythonConnection, as: Python

  @doc false
  @spec start_link(any) :: :ignore | {:error, any} | {:ok, pid}
  def start_link(_), do:
    GenServer.start_link(__MODULE__, nil, name: __MODULE__)


  @doc false
  @spec init(any) :: {:ok, pid}
  def init(_) do
    # Get the pid of the python session.
    python_session = Python.start_link()

    # Start the connection to the python session.
    Python.call(python_session, :api, :register_handler, [self()])
    {:ok, python_session}
  end

  @doc """
  Cast a Python function / async call of it. The first argument
  is the atomic function name while the other is a list of
  arguments of which to feed into the function.
  """
  @spec cast_function(atom(), list(any())) :: :ok
  def cast_function(function, arguments), do:
    GenServer.cast(__MODULE__, {function, arguments})

  @doc """
  Call a Python function. The first argument is the function. Returns
  `{:ok, binary()}` if everything is ok or `{:error, error}` if not.
  """
  @spec call_function(atom(), list(any())) :: {:error, map} | {:ok, binary()}
  def call_function(function, arguments) do
    try do
      {:ok, GenServer.call(__MODULE__, {function, arguments})}
    rescue
      e in RuntimeError -> {:error, e}
    end
  end

  @doc """
  Similar to `call_function/2` but gives the raw output or raises
  an exception if failed.
  """
  @spec call_function!(atom(), list(any)) :: binary()
  def call_function!(function, arguments) do
       GenServer.call(__MODULE__, {function, arguments})
  end

  @doc false
  def handle_cast({function, arguments}, python_session) do
    Python.call(python_session, :api, function, arguments)
    {:noreply, python_session}
  end

  @doc false
  def handle_call({:compress_img, image}, _caller, python_session) do
    bytes = Python.call(python_session, :api, :compress_img, image)
    {:reply, bytes, python_session}
  end

end
