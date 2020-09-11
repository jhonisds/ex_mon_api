defmodule ExMonApi.Trainer.CreateTest do
  use ExMonApi.DataCase, async: true

  alias ExMonApi.{Repo, Trainer, Trainer.Create}
  alias Ecto.Changeset

  @tag :done
  describe "call/1" do
    test "when all params are valid, creates a trainer" do
      params = %{name: "Jhoni", password: "123456"}

      count_before = Repo.aggregate(Trainer, :count)

      response = Create.call(params)

      count_after = Repo.aggregate(Trainer, :count)

      expected = {:ok, %Trainer{name: "Jhoni"}}

      assert expected = response
      assert count_after > count_before
    end

    test "when there are invalid params, returns the error" do
      params = %{name: "Jhoni"}
      response = Create.call(params)

      assert {:error, changeset} = response
      assert %{password: ["can't be blank"]} == errors_on(changeset)
    end
  end
end
