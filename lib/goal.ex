defmodule Ahorcado.Goal do
    @behaviour Game.Goal.Api # Esto es como hacer una implementación de la interfaz

    #@client Application.compile_env(:ahorcado, __MODULE__, Game.Goal.DummyGenerator) # Se usa para generar aleatoriamente

    #defdelegate generate, to: @client
    def generate do
        client = Application.get_env(:ahorcado, __MODULE__, Game.Goal.DummyGenerator)
        client.generate()
    end
end