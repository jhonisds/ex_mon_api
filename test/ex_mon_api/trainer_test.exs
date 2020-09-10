defmodule ExMonApi.TrainerTest do
  use ExMonApi.DataCase, async: true

  alias ExMonApi.Trainer
  alias Ecto.Changeset

  @tag :done
  describe "changeset/1" do
    test "when all params are valid, returns a valid changeset" do
      params = %{name: "Jhoni", password: "123456"}
      response = Trainer.changeset(params)

      expected = %Changeset{
        action: nil,
        changes: %{name: "Jhoni", password: "123456"},
        errors: [],
        data: %Trainer{},
        valid?: true
      }

      assert expected = response
    end

    test "when there are invalid params, returns an invalid changeset" do
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

  describe "build/1" do
    test "when all params are valid, returns a struct" do
      params = %{name: "jhoni", password: "123456"}
      response = Trainer.build(params)

      expected = {:ok, %Trainer{name: "jhoni", password: "123456"}}

      # execute patern match because field password changed
      assert expected = response
    end

    test "returns error when there are invalid params" do
      params = %{password: "123456"}
      {:error, response} = Trainer.build(params)

      expected = %Changeset{valid?: false}

      # execute patern match because field password changed
      assert expected = response
      assert errors_on(response) == %{name: ["can't be blank"]}
    end
  end
end
