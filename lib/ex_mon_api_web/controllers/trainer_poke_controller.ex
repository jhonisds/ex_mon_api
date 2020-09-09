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

  def delete(conn, %{"id" => id}) do
    id
    |> ExMonApi.delete_trainer_poke()
    |> handle_delete(conn)
  end

  def show(conn, %{"id" => id}) do
    id
    |> ExMonApi.fetch_trainer_poke()
    |> handle_response(conn, "show.json", :ok)
  end

  defp handle_response({:ok, poke}, conn, view, status) do
    conn
    |> put_status(status)
    |> render(view, poke: poke)
  end

  defp handle_response({:error, _changeset} = error, _conn, _view, _status), do: error

  defp handle_delete({:ok, _poke}, conn) do
    conn
    |> put_status(:no_content)
    |> text("")
  end

  defp handle_delete({:error, _reason} = error, _conn), do: error
end
