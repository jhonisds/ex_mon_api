defmodule ExMonApi.Poke do
  @moduledoc """
  Module Poke
  """
  @keys [:id, :name, :weight, :types]

  @enforce_keys @keys

  # encode struct to Json
  @derive Jason.Encoder
  defstruct @keys

  def build(%{"id" => id, "name" => name, "weight" => weight, "types" => types}) do
    %__MODULE__{
      id: id,
      name: name,
      weight: weight,
      types: parse_types(types)
    }
  end

  defp parse_types(types), do: Enum.map(types, fn item -> item["type"]["name"] end)
end
