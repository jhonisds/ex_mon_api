defmodule ExMonApiWeb.WelcomeController do
  use ExMonApiWeb, :controller

  def index(conn, _params) do
    conn
    |> IO.inspect(label: "DEBUG")
    |> text("Hello world")
  end
end
