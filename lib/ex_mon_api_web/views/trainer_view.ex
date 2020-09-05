defmodule ExMonApiWeb.TrainerView do
  use ExMonApiWeb, :view

  alias ExMonApi.Trainer

  def render("create.json", %{trainer: %Trainer{id: id, name: name, inserted_at: inserted_at}}) do
    %{
      message: "Trainer created!",
      trainer: %{
        id: id,
        name: name,
        inserted_at: inserted_at
      }
    }
  end

  def render("show.json", %{trainer: trainer}), do: trainer_view(trainer)

  def render("index.json", %{trainer: trainer}), do: Enum.map(trainer, &trainer_view/1)

  defp trainer_view(trainer) do
    %{
      id: trainer.id,
      name: trainer.name,
      inserted_at: trainer.inserted_at
    }
  end
end
