defmodule ExMonApi.Trainer.Pokemon.Get do
  @moduledoc """
  Module get trainers pokes
  """

  alias ExMonApi.{Repo, Trainer.Pokes}
  alias Ecto.UUID

  def call(id) do
    case UUID.cast(id) do
      :error -> {:error, "Invalid ID format"}
      {:ok, uuid} -> get_pokemon(uuid)
    end
  end

  defp get_pokemon(uuid) do
    case Repo.get(Pokes, uuid) do
      nil ->
        {:error, "Pokemon not found"}

      poke ->
        {:ok, Repo.preload(poke, :trainer)}
    end
  end
end
