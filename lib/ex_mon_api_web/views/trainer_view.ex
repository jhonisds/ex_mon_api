defmodule ExMonApiWeb.TrainerView do
  use ExMonApiWeb, :view

  alias ExMonApi.Trainer

  def render("create.json", %Trainer{id: id, name: name, inserted_at: inserted_at}) do
    %{
      message: "Trainer created!",
      trainer: %{
        id: id,
        name: name,
        inserted_at: inserted_at
      }
    }
  end
end
