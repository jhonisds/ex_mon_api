defmodule ExMonApi.Pokemon.Get do
  @moduledoc """
  Module Get
  """

  alias ExMonApi.Poke.Client
  alias ExMonApi.Poke

  def call(name) do
    name
    |> Client.get_pokemon()
    |> handle_response
  end

  defp handle_response({:ok, body}), do: {:ok, Poke.build(body)}
  defp handle_response({:error, _reason} = error), do: error
end
