defmodule ExMonApiWeb.Auth.Guardian do
  @moduledoc """
  Module Guardian Auth
  """
  use Guardian, otp_app: :ex_mon_api

  def subject_for_token(trainer, _claims) do
    sub = to_string(trainer.id)
    {:ok, sub}
  end

  def resource_from_claims(claims) do
    claims
    |> Map.get("sub")
    |> ExMonApi.get_trainer()
  end
end
