defmodule ExMonApi.Trainer.GetAll do
  @moduledoc """
  Module get all trainers
  """

  alias ExMonApi.{Repo, Trainer}

  def call() do
    case Repo.all(Trainer) do
      nil ->
        {:error, "Trainer not found"}

      trainer ->
        {:ok, trainer}
    end
  end
end
