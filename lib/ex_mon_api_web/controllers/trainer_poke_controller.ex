defmodule ExMonApiWeb.TrainerPokeController do
  @moduledoc """
  Module Trainer Poke controller
  """
  use ExMonApiWeb, :controller

  action_fallback ExMonApiWeb.FallbackController

  def create(conn, params) do
    params
    |> ExMonApi.create_trainer_poke()
    |> handle_response(conn, "create.json", :created)
  end

  defp handle_response({:ok, poke}, conn, view, status) do
    conn
    |> put_status(status)
    |> render(view, poke: poke)
  end

  defp handle_response({:error, _changeset} = error, _conn, _view, _status), do: error
end
