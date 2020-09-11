defmodule ExMonApiWeb.TrainerView do
  use ExMonApiWeb, :view

  alias ExMonApi.Trainer

  def render("sign_in.json", %{token: token}) do
    %{token: token}
  end

  def render("create.json", %{
        trainer: %Trainer{id: id, name: name, inserted_at: inserted_at},
        token: token
      }) do
    %{
      message: "Trainer created!",
      trainer: %{
        id: id,
        name: name,
        inserted_at: inserted_at
      },
      token: token
    }
  end

  def render("show.json", %{trainer: trainer}), do: trainer_view(trainer)

  def render("index.json", %{trainer: trainer}), do: Enum.map(trainer, &trainer_view/1)

  def render("update.json", %{
        trainer: %Trainer{id: id, name: name, inserted_at: inserted_at, updated_at: updated_at}
      }) do
    %{
      message: "Trainer updated!",
      trainer: %{
        id: id,
        name: name,
        inserted_at: inserted_at,
        updated_at: updated_at
      }
    }
  end

  defp trainer_view(trainer) do
    %{
      id: trainer.id,
      name: trainer.name,
      inserted_at: trainer.inserted_at
    }
  end
end
