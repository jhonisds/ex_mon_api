defmodule ExMonApiWeb.Controller.TrainerControllerTest do
  use ExMonApiWeb.ConnCase

  import ExMonApiWeb.Auth.Guardian
  alias ExMonApi.Trainer

  describe "show/2" do
    setup %{conn: conn} do
      params = %{name: "Jhoni", password: "123456"}
      {:ok, trainer} = ExMonApi.create_trainer(params)
      {:ok, token, _claims} = encode_and_sign(trainer)

      header =
        conn
        |> put_req_header("authorization", "Bearer #{token}")

      {:ok, conn: header}
    end

    test "when there is a trainer with the given id, returns the trainer", %{conn: conn} do
      params = %{name: "Jhoni", password: "123456"}

      {:ok, %Trainer{id: id}} = ExMonApi.create_trainer(params)

      response =
        conn
        |> get(Routes.trainer_path(conn, :show, id))
        |> json_response(:ok)

      assert %{"id" => _id, "inserted_at" => _iserted_at, "name" => "Jhoni"} = response
    end

    test "when there is a error, returns the errors ", %{conn: conn} do
      response =
        conn
        |> get(Routes.trainer_path(conn, :show, "1234"))
        |> json_response(:bad_request)

      expected = %{"message" => "Invalid ID format"}

      assert expected == response
    end
  end
end
