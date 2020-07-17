defmodule PheedThePi.PythonManager do
    @moduledoc """
    Main module for the Python code execution.
    """

    alias PheedThePi.PythonServer, as: Python

    @spec message(String.t()) :: :ok
    def message(message) do
      Python.cast_function(:message, [message])
    end

end
