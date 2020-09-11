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
      params = %{password: "123456"}
      response = Trainer.changeset(params)

      expected =
        %Changeset{
          changes: %{password: "123456"},
          data: %Trainer{},
          valid?: false
        } = response

      assert expected == response
      assert errors_on(response) == %{name: ["can't be blank"]}
    end
  end
end
