defmodule ExMonApiWeb.Auth.Guardian do
  @moduledoc """
  Module Guardian Auth
  """
  use Guardian, otp_app: :ex_mon_api

  alias ExMonApi.{Repo, Trainer}

  def subject_for_token(trainer, _claims) do
    sub = to_string(trainer.id)
    {:ok, sub}
  end

  def resource_from_claims(claims) do
    claims
    |> Map.get("sub")
    |> ExMonApi.get_trainer()
  end

  def authenticate(%{"id" => trainer_id, "password" => password}) do
    case Repo.get(Trainer, trainer_id) do
      nil -> {:error, "Trainer not found!"}
      trainer -> validate_password(trainer, password)
    end
  end

  def validate_password(%Trainer{password_hash: hash} = trainer, password) do
    case Argon2.verify_pass(password, hash) do
      true -> create_token(trainer)
      false -> {:error, :unauthorized}
    end
  end

  def create_token(trainer) do
    {:ok, token, _claims} = encode_and_sign(trainer)
    {:ok, token}
  end
end
