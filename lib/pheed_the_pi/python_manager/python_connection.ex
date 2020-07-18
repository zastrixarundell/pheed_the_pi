defmodule PheedThePi.PythonConnection do
  @moduledoc """
  Module responsible for the Python connection and IO.
  """

  def start() do
    path = [
      File.cwd!(), ".python"
    ] |> Path.join() |> IO.inspect(label: "Python priv path")

    {:ok, pid} = :python.start_link([{:python_path, to_charlist(path)}])

    pid
  end

  def call(pid, module, function, arguments \\ []), do:
    :python.call(pid, module, function, arguments)

  def cast(pid, message), do:
    :python.cast(pid, message)

  def stop(pid), do:
    :python.stop(pid)

end
