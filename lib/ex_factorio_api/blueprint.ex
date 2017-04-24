defmodule ExFactorioApi.Blueprint do
  @moduledoc """
  Documentation for ExFactorioApi.Blueprint.
  """


  @doc """
  Hello world.

  ## Examples

  ### Factorio 0.15 blueprint

      iex> input = "0eNp9j9tqAzEMRP9lnr2QpG5C/CsllL0oiWAtG19Kl8X/Hnu30Le8CEZIM2dWDHMmH1gSzAoenUSYrxWRH9LPbZcWTzDgRBYK0tum+hjJDjPLo7P9+GSh7gNFgWWiX5hjuSmQJE5Mu98mlm/JdqBQD947KXgX67OTRlANDwpLnTUh0MgbkLvf49MF6ny2vn40wD1rQzWInmjqrJvyvHuOLreautwa3t/Vf3+FHwpxyzxrfdKfF329nEt5Adp+YYw="
      iex> ExFactorioApi.Blueprint.string_to_data(input)
      %{
        blueprint: %{
          entities: [%{
            entity_number: 1,
            items: [%{count: 4, item: "speed-module-3"}],
            name: "assembling-machine-3",
            position: %{x: 0, y: 0},
            recipe: "offshore-pump",
          }],
          icons: [%{index: 1, signal: %{name: "assembling-machine-3", type: "item"}}],
          item: "blueprint",
          version: 64424574976,
        }
      }

  """
  def string_to_data(input)
  def string_to_data("0"<>input = all_input) do
    try do
      version_0_string_to_data(input)
    catch
      :error, {:badmatches, _} -> mod_string_to_data(all_input)
    end
  end
  def string_to_data(input), do: mod_string_to_data(input)


  def version_0_string_to_data(input) when is_binary(input) do
    data =
      input
      |> :base64.decode()
      |> :zlib.uncompress()
      |> Poison.decode!(keys: :atoms!)
      # |> Poison.decode!()
      # |> ExFactorioApi.Serialized.decode()

    data
  end


  def mod_string_to_data(input) when is_binary(input) do
    {:ok, [data]} =
      input
      |> :base64.decode()
      |> :zlib.gunzip()
      |> :luerl.eval()

    data
  end


  def __atom_cache__ do
    [
      :blueprint,
      :entities,
      :entity_number,
      :icons,
      :recipe,
      :signal,
      :x, :y
    ]
  end
end
