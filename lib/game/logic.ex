defmodule Game.Logic do
    @moduledoc """
    Lógica principal del Juego.
    """

    alias Game.State

    @doc """
    Retorna el estado del juego después que el usuario realiza un intento.

    """
    def guess(letter, %State{} = state) do
        %{goal: goal, matches: matches, misses: misses, limit: limit} = state # Desestructurar

        #if String.contains?(word, letter) do # La letra está contenida en la palabra?
        if MapSet.member?(goal, letter) do
            #matches = [letter | matches]
            matches = MapSet.put(matches, letter)
            #completed? = word |> String.codepoints() 
            #|> String.graphemes() # Toma el String y lo transforma en un array de caracteres 
            #|> Enum.all?(&(&1 in matches)) # Función de una línea general. Enum.All? retorna True o False si encuentra coincidencia en el array Matches
            completed? = MapSet.equal?(goal, matches)
            %{state | matches: matches, completed?: completed?} # Adiciona al principio de la lista la letra como asierto
        else 
            #%{state | misses: [letter | misses], limit: limit - 1} # Sino, adiciona al principio de la lista la letra como fallo
            %{state | misses: MapSet.put(misses, letter), limit: limit - 1}
        end
    end

end