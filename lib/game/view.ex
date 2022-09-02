defmodule Game.View do
    @moduledoc """
    Capa de presentación para el juego del ahorcado.
    """

    alias Game.State
    
    defp mask_word(%State{matches: matches, word: word, mask: mask} = _state) do
        if MapSet.size(matches) > 0 do
            matches = Enum.join(matches)
            String.replace(word, ~r/[^#{matches}]/, mask) # Expresión Regular que reemplaza cada caracter de la palabra por la máscara, excluyendo los caracteres de la lista
        else
            String.replace(word, ~r/./, mask) # Expresión Regular que reemplaza cada caracter de la palabra por la máscara
        end
    end

    @doc """
    Muestra en pantalla el avance del juego

    """
    def format_response(%State{limit: limit, completed?: false} = state) when limit > 0 do
        {mask_word(state), state}
    end
    def format_response(%State{limit: limit, word: word} = state) when limit > 0 do
        {"Ganaste!, adivinaste la palabra: #{word}", state}
    end
    def format_response(%State{word: word} = state) do
        {"Juego terminado, la palabra clave era: #{word}", state}
    end

end