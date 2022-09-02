defmodule Ahorcado do
  @moduledoc """
  Ahoracado, el famoso juego de adivinanza.
  """

  alias Game.State
  alias Game.Logic
  alias Game.View, as: View

  @doc """
  Inicia el Juego.

  ## Examples

      iex> {_, state} = Ahorcado.start_game()

  """
  def start_game do
    word = "palabraclave"

    word
    |> State.init()
    |> View.format_response()
  end

  def take_a_guess(letter, %State{limit: limit, completed?: false} = state) when limit > 0 do
    letter 
    |> String.downcase()
    |> Logic.guess(state)
    |> View.format_response()
  end
  def take_a_guess(_, state), do: View.format_response(state)

end
