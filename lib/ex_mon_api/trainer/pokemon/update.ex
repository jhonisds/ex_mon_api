defmodule ExMonApi.Trainer.Pokemon.Update do
  @moduledoc """
  Module update trainers poke
  """

  alias ExMonApi.{Repo, Trainer.Poke}
  alias Ecto.UUID

  def call(%{"id" => uuid} = params) do
    case UUID.cast(uuid) do
      :error -> {:error, "Invalid ID format"}
      {:ok, _uuid} -> update(params)
    end
  end

  defp update(%{"id" => uuid} = params) do
    case Repo.get(Poke, uuid) do
      nil -> {:error, "Pokemon not found"}
      poke -> update_poke(poke, params)
    end
  end

  defp update_poke(poke, params) do
    poke
    |> Poke.update_changeset(params)
    |> Repo.update()
  end
end
