defmodule ExMonApi do
  @moduledoc """
  ExMonApi keeps the contexts that define your domain
  and business logic.

  Contexts are also responsible for managing your data, regardless
  if it comes from the database, an external API or others.
  """

  alias ExMonApi.{Pokemon, Trainer}
  alias ExMonApi.Trainer.Pokemon, as: TrainerPoke

  defdelegate create_trainer(params), to: Trainer.Create, as: :call
  defdelegate delete_trainer(params), to: Trainer.Delete, as: :call
  defdelegate get_trainer(params), to: Trainer.Get, as: :call
  defdelegate get_all_trainer(), to: Trainer.GetAll, as: :call
  defdelegate update_trainer(params), to: Trainer.Update, as: :call
  defdelegate fetch_pokemon(params), to: Pokemon.Get, as: :call

  defdelegate create_trainer_poke(params), to: TrainerPoke.Create, as: :call
  defdelegate delete_trainer_poke(params), to: TrainerPoke.Delete, as: :call
  defdelegate fetch_trainer_poke(params), to: TrainerPoke.Get, as: :call
end
