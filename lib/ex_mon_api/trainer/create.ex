defmodule ExMonApi.Trainer.Create do
  @moduledoc """
  Module create trainers
  🚀 ➜ curl -d "name=jhoni&password=123456" http://localhost:4000/api/trainers
  """

  alias ExMonApi.{Repo, Trainer}

  def call(params) do
    params
    |> Trainer.build()
    |> create_trainer
  end

  defp create_trainer({:ok, struct}), do: Repo.insert(struct)
  defp create_trainer({:error, _changeset} = error), do: error
end
