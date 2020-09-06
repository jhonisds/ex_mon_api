defmodule ExMonApi.Trainer.Poke do
  @moduledoc """
  Schema Pokes
  """
  use Ecto.Schema

  import Ecto.Changeset
  alias ExMonApi.Trainer

  @primary_key {:id, Ecto.UUID, autogenerate: true}
  @foreign_key_type Ecto.UUID
  @required [:name, :nick_name, :weight, :types]

  schema "pokes" do
    field :name, :string
    field :nick_name, :string
    field :weight, :integer
    field :types, {:array, :string}
    belongs_to(:trainer, Trainer)

    timestamps()
  end

  def build(params) do
    params
    |> changeset()
    |> apply_action(:insert)
  end

  def changeset(params) do
    %__MODULE__{}
    |> cast(params, @required)
    |> validate_required(@required)
    |> validate_length(:nick_name, min: 2)
  end
end
