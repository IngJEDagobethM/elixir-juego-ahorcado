defmodule Game.Goal.Api do
    @moduledoc """
    API Generador de palabra.
    """

    @doc """
    Genera una palabra, frase u oración
    """
    @callback generate() :: String.t() # Esto funciona como una interfaz donde se define el método pero no su implementación
end