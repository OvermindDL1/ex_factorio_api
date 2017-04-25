defmodule ExFactorioApi.Blueprint do
  @moduledoc """
  Documentation for ExFactorioApi.Blueprint.
  """


  @doc """
  Hello world.

  ## Examples

  ### Factorio 0.15 blueprint

      iex> # Test by justarandomgeek
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

      iex> # Test by justarandomgeek
      iex> input = "0eNrlWNuOmzAQ/Zd5bMkWm1vC224/o2ojLt5kJDDIMVGjiH+vDSsKBBJAUbJqXxKZjM8cz5kZTzhDmBQsF8gl+GfAKOMH8H+c4YA7HiT6mTzlDHxAyVIwgAepXgUC5T5lEqNVlKUh8kBmAkoDkMfsN/ikNG5ihLhbsYRFUiiUPEtYaz8tfxrAuESJrCZULU5bXqQhE8pBA5OyGIu0h2RAnh3U5oxr9wpw5RhwUl9U+VCH5MoYq7OegegPweK2G1QrW1miiAqU1VJRKkt9rB4TeuVAFzSslw8e5MUZYbITjPE+F6vlWK+9Ljcyws1quGlhZcBlW64Ldq0YxShqYnUcMi5FlmxDtg+OqLYq+3dMJBMj2XJEIQv1pPFfW6xeoTp1odON3siWMYy3FobVypg5GN9bGHaDYakwzhBlLCPsG2VymZx2kxbd0LvDof8Lu1U/x9hwfUdxkNvJUWBBtK8DUSeHZmJAljMR1P7hm9qTFTIvZqOW0wvNuSw0A+iIMelVAjGnlakzWxT6WUShXU1+3V2Twex256hiT+tH7lwRzE9TGKQrwpfHiDDQ5z9EGDR3+ua9WqHTasVbKpP5ZJXMrkhfHyMS7YXZHRVtqJ9N1GS9ZMww500Zmxv5MlbWmyVjhvmYKcO5w5RByB3GDHfpmLEeibq++RbOGc/ups+YMrSIiy+0saokZPFY8c9PFROb3ZXWaE5rP4Quva/If3lfra9G3etLZFwtI6L/qU8dIEttXL0F8FsvHgw4qhZfK2Db1HY8e+O5ZfkH/2uqhw=="
      iex> output = ExFactorioApi.Blueprint.string_to_data(input)
      iex> is_map(output.blueprint)
      true

      iex> # This is a lot of random stuff, great test, from Danielv123
      iex> input = "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"
      iex> output = ExFactorioApi.Blueprint.string_to_data(input)
      iex> is_map(output.blueprint)
      true

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


  # def icon_table_from_data_version_0(%{} = data) do
  #   icons =
  #     data.blueprint.icons
  #     |> Enum.map(&{&1.index, &1.signal})
  #     |> Enum.into(%{})
  #
  #   data.blueprint.entities
  #   |> Enum.map()
  # end


  def __atom_cache__ do
    [
      :"1", :"2", # Used for 'which' circuit I think...
      :arithmetic_conditions,
      :bar,
      :blueprint,
      :circuit_id,
      :connections,
      :control_behavior,
      :direction,
      :entities,
      :entity_id,
      :entity_number,
      :filters,
      :first_signal,
      :icons,
      :index,
      :name,
      :output_signal,
      :recipe,
      :signal,
      :x, :y,
    ]
  end
end
