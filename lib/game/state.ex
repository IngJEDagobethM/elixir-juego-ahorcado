defmodule Game.State do

    @enforce_keys [:word, :goal] # Fuerza a que se cree la estructura con los datos referenciados
    defstruct [ # Toma el nombre del módulo donde se define.
        :word,
        :goal,
        misses: MapSet.new(),
        matches: MapSet.new(),
        limit: 6,
        mask: "_",
        completed?: false
    ]

    @doc """
    Crea el estado inicial del juego.

    """
    @spec init(String.t()) :: %Game.State{} # Se define el tipo de dato que se espera recibir por parámetros y el tipo de dato de retorno
    def init(word) do
        word = String.downcase(word)

        goal = word 
        |> String.graphemes()
        |> MapSet.new() # Estructura de datos semejante a un conjunto que no permite elementos repetidos

        #%{word: word, goal: goal, misses: MapSet.new(), matches: MapSet.new(), limit: 6, mask: "_", completed?: false}
        # __MODULE__ es el nombre del módulo actual (como en Python)
        struct!(__MODULE__, word: word, goal: goal) # struct! crea la estructura pasando el nombre de la estructura y los atributos
    end
end