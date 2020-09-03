defmodule ExMonApiWeb.WelcomeController do
  use ExMonApiWeb, :controller

  def index(conn, _params) do
    conn
    |> text("Hello world")
  end
end
