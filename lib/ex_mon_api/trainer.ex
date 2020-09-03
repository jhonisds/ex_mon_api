defmodule ExMonApi.Trainer do
  @moduledoc """
  Module Trainer
  """
  use Ecto.Schema

  import Ecto.Changeset

  @primary_key {:id, Ecto.UUID, autogenerate: true}
  @required_params [:name, :password_hash]

  schema "trainers" do
    field :name, :string
    field :password_hash, :string
    timestamps()
  end

  def changeset(params) do
    %__MODULE__{}
    |> cast(params, @required_params)
    |> validate_required(@required_params)
  end
end
