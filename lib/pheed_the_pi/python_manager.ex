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

    @spec send_button_event(String.t(), boolean()) :: :ok
    def send_button_event(button, pressed), do:
      Python.cast_function(:set_direction, [button, pressed])

    @spec compress_image(binary()) :: binary()
    def compress_image(binary_image), do:
      Python.call_function(:compress_img, [binary_image])

end
