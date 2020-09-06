defmodule ExMonApi.Repo.Migrations.CreatePokeTable do
  use Ecto.Migration

  def change do
    create table(:pokes, primary_key: false) do
      add :id, :uuid, primary_key: true
      add :name, :string
      add :nick_name, :string
      add :weight, :integer
      add :types, {:array, :string}
      add :trainer_id, references(:trainers, type: :uuid, on_delete: :delete_all), null: false

      timestamps()
    end
  end
end
