defmodule ExMonApi.Trainer.Pokemon.Delete do
  @moduledoc """
  Module delete trainers poke
  """

  alias ExMonApi.{Trainer.Poke, Repo}
  alias Ecto.UUID

  def call(id) do
    case UUID.cast(id) do
      :error -> {:error, "Invalid ID format"}
      {:ok, uuid} -> delete_poke(uuid)
    end
  end

  defp delete_poke(uuid) do
    case fetch_pokemon(uuid) do
      nil -> {:error, "Pokemon not found"}
      poke -> Repo.delete(poke)
    end
  end

  defp fetch_pokemon(uuid), do: Repo.get(Poke, uuid)
end
