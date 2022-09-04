defmodule Ahorcado do
  @moduledoc """
  Ahoracado, el famoso juego de adivinanza.
  """

  alias Game.State
  alias Game.Logic
  alias Game.View, as: View
  alias Ahorcado.Goal

  @doc """
  Inicia el Juego.

  ## Examples

      iex> {_, state} = Ahorcado.start_game()

  """
  def start_game do
    Goal.generate()
    |> State.init()
    |> View.format_response()
  end

  @doc """
  Valida el intento del usuario.

  ## Examples

      iex> {_word, state} = Ahorcado.start_game()
      iex> Ahorcado.take_a_guess("a", state) |> elem(0)
      "_a_a__a__a__"

  """
  def take_a_guess(letter, %State{limit: limit, completed?: false} = state) when limit > 0 do
    letter 
    |> String.downcase()
    |> Logic.guess(state)
    |> View.format_response()
  end
  def take_a_guess(_, state), do: View.format_response(state)

end
