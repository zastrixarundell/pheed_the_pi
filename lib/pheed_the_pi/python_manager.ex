defmodule PheedThePi.PythonManager do
    @moduledoc """
    Main module for the Python code execution.
    """

    alias PheedThePi.PythonServer, as: Python

    @doc """
    Send button event to the Python API.

    First argument if the string
    """
    @spec send_button_event(:up | :down | :left | :right, boolean()) :: :ok
    def send_button_event(button, pressed), do:
      Python.cast_function(:set_direction, [button, pressed])

    @doc """
    Sends the binary of a image to python for processing and return the binary for said image.
    """
    @spec compress_image(binary()) :: binary()
    def compress_image(binary_image), do:
      Python.call_function!(:compress_img, [binary_image])

end
