defmodule PheedThePi.PythonConnection do
  @moduledoc """
  Module responsible for the Python connection and IO.
  """

  @doc """
  Start the Python Erlport connected to the calling process.
  """
  @spec start_link :: pid
  def start_link() do
    path = [
      File.cwd!(), ".python"
    ] |> Path.join() |> IO.inspect(label: "Python priv path")

    {:ok, pid} = :python.start_link([{:python_path, to_charlist(path)}])

    pid
  end

  @doc """
  Call a Python function. First argument is the Erlport pid, second is
  the atom of the module, third is the atom of the function and the last is a list of
  arguments.
  """
  @spec call(pid(), atom(), atom(), list(any())) :: any
  def call(pid, module, function, arguments \\ []), do:
    :python.call(pid, module, function, arguments)

  @doc """
  Cast a message to the Python API. First argument is the Erlport pid.
  """
  @spec cast(pid(), binary()) :: :ok
  def cast(pid, message), do:
    :python.cast(pid, message)

  @doc """
  Stop the Erlport. First argument is the Erlport pid.
  """
  @spec stop(pid()) :: :ok
  def stop(pid), do:
    :python.stop(pid)

end
