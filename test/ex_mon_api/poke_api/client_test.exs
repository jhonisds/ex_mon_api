defmodule ExMonApi.PokeApi.ClientTest do
  use ExUnit.Case, async: true

  import Tesla.Mock

  alias ExMonApi.Poke.Client

  @base_url "https://pokeapi.co/api/v2/pokemon/"

  @tag :done
  describe "get_pokemon/1" do
    test "when there is a pokemon with the given name, returns the pokemon" do
      body = %{"name" => "pikachu", "weight" => 60, "types" => ["eletric"]}

      mock(fn %{method: :get, url: @base_url <> "pikachu"} ->
        %Tesla.Env{status: 200, body: body}
      end)

      response = Client.get_pokemon("pikachu")

      expected = {:ok, %{"name" => "pikachu", "weight" => 60, "types" => ["eletric"]}}
      assert expected == response
    end

    test "returns error pokemon not found" do
      mock(fn %{method: :get, url: @base_url <> "invalid"} -> %Tesla.Env{status: 404} end)

      response = Client.get_pokemon("invalid")

      expected = {:error, "Pokemon not found"}
      assert expected == response
    end

    test "returns error timeout" do
      mock(fn %{method: :get, url: @base_url <> "pikachu"} -> {:error, :timeout} end)

      response = Client.get_pokemon("pikachu")

      expected = {:error, :timeout}
      assert expected == response
    end
  end
end
