defmodule ExMonApiWeb.TrainerPokeView do
  use ExMonApiWeb, :view

  alias ExMonApi.Trainer.Poke

  def render("create.json", %{
        poke: %Poke{
          id: id,
          name: name,
          inserted_at: inserted_at,
          nick_name: nick_name,
          types: types,
          trainer_id: trainer_id,
          weight: weight
        }
      }) do
    %{
      message: "Pokemon Created",
      pokemon: %{
        id: id,
        name: name,
        inserted_at: inserted_at,
        nick_name: nick_name,
        types: types,
        trainer_id: trainer_id,
        weight: weight
      }
    }
  end

  def render("show.json", %{
        poke: %Poke{
          id: id,
          name: name,
          inserted_at: inserted_at,
          nick_name: nick_name,
          types: types,
          trainer: %{id: trainer_id, name: trainer_name},
          weight: weight
        }
      }) do
    %{
      pokemon: %{
        id: id,
        name: name,
        inserted_at: inserted_at,
        nick_name: nick_name,
        types: types,
        trainer: %{trainer_id: trainer_id, name: trainer_name},
        weight: weight
      }
    }
  end

  # def render("show.json", %{trainer: trainer}), do: trainer_view(trainer)

  # def render("index.json", %{trainer: trainer}), do: Enum.map(trainer, &trainer_view/1)

  # def render("update.json", %{
  #       trainer: %Trainer{id: id, name: name, inserted_at: inserted_at, updated_at: updated_at}
  #     }) do
  #   %{
  #     message: "Trainer updated!",
  #     trainer: %{
  #       id: id,
  #       name: name,
  #       inserted_at: inserted_at,
  #       updated_at: updated_at
  #     }
  #   }
  # end

  defp trainer_view(trainer) do
    %{
      id: trainer.id,
      name: trainer.name,
      inserted_at: trainer.inserted_at
    }
  end
end
