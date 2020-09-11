defmodule ExMonApiWeb.FallbackController do
  @moduledoc """
  Module Fallback controller
  """
  use ExMonApiWeb, :controller

  action_fallback ExMonApiWeb.FallbackController

  def call(conn, {:error, :unauthorized}) do
    conn
    |> put_status(:unauthorized)
    |> put_view(ExMonApiWeb.ErrorView)
    |> render("401.json", message: "Access unauthorized")
  end

  def call(conn, {:error, result}) do
    conn
    |> put_status(:bad_request)
    |> put_view(ExMonApiWeb.ErrorView)
    |> render("400.json", result: result)
  end
end
