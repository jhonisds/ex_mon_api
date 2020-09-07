defmodule ExMonApi.Trainer.Pokemon.Create do
  @moduledoc """
  Module Pokemon create
  """
  alias ExMonApi.Poke
  alias ExMonApi.Trainer.Poke, as: TrainerPoke
  alias ExMonApi.Poke.Client
  alias ExMonApi.Repo

  def call(%{"name" => name} = params) do
    name
    |> Client.get_pokemon()
    |> handle_response(params)
  end

  def handle_response({:ok, body}, params) do
    body
    |> Poke.build()
    |> create_pokemon(params)
  end

  def handle_response({:error, _msg} = error, _params), do: error

  defp create_pokemon(%Poke{name: name, weight: weight, types: types}, %{
         "nick_name" => nick_name,
         "trainer_id" => trainer_id
       }) do
    params = %{
      name: name,
      weight: weight,
      types: types,
      nick_name: nick_name,
      trainer_id: trainer_id
    }

    params
    |> TrainerPoke.build()
    |> handle_build()
  end

  defp handle_build({:ok, poke}), do: Repo.insert(poke)
  defp handle_build({:error, _changeset} = error), do: error
end
