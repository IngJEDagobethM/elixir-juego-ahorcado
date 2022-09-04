defmodule AhorcadoTest do
  use ExUnit.Case
  doctest Ahorcado

  defmodule TestGenerator do # Se define un submódulo dónde se implementa el contrato del Ahorcado.Game.Goal.API
    @behaviour Game.Goal.Api

    def generate, do: "palabraclave" # Siempre devuelvo la palabra que cumple con mi test
  end
  
  describe "take_a_guess/2" do

    setup do
      {"____________", state} = Ahorcado.start_game
      %{state: state}
    end

    test "announces when then user wins", %{state: state} do
      intentos = ["r","v","e","p","c","a","l","m","b"]
      resultado_esperado = "Ganaste!, adivinaste la palabra: palabraclave"

      {result, state} = check(intentos, state)

      #assert {"_a_a__a__a__", _} = Ahorcado.take_a_guess("a", state)
      assert resultado_esperado == result
      assert state.completed?

    end

    test "announces when then user loses", %{state: state} do
      intentos = ["z","q","w","p","k","a","l","m","i"]
      resultado_esperado = "Juego terminado, la palabra clave era: palabraclave"

      {result, state} = check(intentos, state)

      assert resultado_esperado == result
      refute state.completed?

    end

    defp check(attemps, state) do
      Enum.reduce(attemps, {"", state}, fn letter, {_, state} ->
        Ahorcado.take_a_guess(letter, state)
      end)
    end
  
  end

end
