defmodule PheedThePi.PythonManager do
    @moduledoc """
    Main module for the Python code execution.
    """

    alias PheedThePi.PythonServer, as: Python

    @spec message(String.t()) :: :ok
    def message(message), do:
      Python.cast_function(:message, [message])

    @spec send_python_message(any) :: :ok
    def send_python_message(message), do:
      Python.send_message(message)

end
