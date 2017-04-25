defmodule ExFactorioApi.Serialized do
  # @moduledoc """
  # Documentation for ExFactorioApi.Serialized.
  # """
  #
  # defmodule Position do
  #   defstruct [:x, :y]
  # end
  #
  # defmodule Entity do
  #   defstruct [
  #     :name,
  #     {:index, -1},
  #     :position,
  #     {:recipe, nil},
  #     {:items, nil},
  #   ]
  # end
  #
  # defmodule Signal do
  #   defstruct [:name, :type]
  # end
  #
  # defmodule ItemStack do
  #   defstruct [:count, :item]
  # end
  #
  # defmodule Blueprint do
  #   defstruct [
  #     :entities,
  #     :icons,
  #     :item,
  #     :version,
  #   ]
  # end
  #
  #
  # @doc """
  # decode
  #
  # ## Examples
  #
  # ### Factorio 0.15 blueprint
  #
  #     iex> input = "0eNp9j9tqAzEMRP9lnr2QpG5C/CsllL0oiWAtG19Kl8X/Hnu30Le8CEZIM2dWDHMmH1gSzAoenUSYrxWRH9LPbZcWTzDgRBYK0tum+hjJDjPLo7P9+GSh7gNFgWWiX5hjuSmQJE5Mu98mlm/JdqBQD947KXgX67OTRlANDwpLnTUh0MgbkLvf49MF6ny2vn40wD1rQzWInmjqrJvyvHuOLreautwa3t/Vf3+FHwpxyzxrfdKfF329nEt5Adp+YYw="
  #     iex> parsed = ExFactorioApi.Blueprint.string_to_data(input)
  #     iex> ExFactorioApi.Serialized.decode(parsed)
  #     :error_versioned
  #
  # """
  # def decode(input_object)
  # def decode([]), do: []
  # def decode([element | rest]), do: [decode(element) | decode(rest)]
  # def decode(nil), do: nil
  # def decode(int) when is_integer(int), do: int
  # def decode(float) when is_float(float), do: float
  # def decode(str) when is_binary(str), do: str
  # def decode(%{"blueprint" => blueprint}) when is_map(blueprint) do
  #   {entities, blueprint} = Map.pop(blueprint, "entities", [])
  #   {icons, blueprint} = Map.pop(blueprint, "icons", [])
  #   {item, blueprint} = Map.pop(blueprint, "item", [])
  #   {version, blueprint} = Map.pop(blueprint, "version", -1)
  #
  #   if map_size(blueprint) > 0, do: throw {:UNHANDLED_BLUEPRINT_CASE, blueprint}
  #
  #   entities = entities |> Enum.map(&decode_entities/1)
  #   icons = icons |> Enum.map(&decode_icon/1) |> Enum.into(%{})
  #   item = decode(item)
  #   version = decode(version)
  #
  #   %Blueprint{
  #     entities: entities,
  #     icons: icons,
  #     item: item,
  #     version: version,
  #   }
  # end
  #
  # def decode_position(%{"x" => x, "y" => y}=p) when map_size(p)==2, do: %Position{x: x, y: y}
  #
  # def decode_entities(%{"entity_number" => entity_number, "name" => name} = entity) when is_integer(entity_number) and is_binary(name) do
  #   %Entity{
  #     name: name,
  #     index: entity_number,
  #     position: decode_position(entity["position"]),
  #     recipe: entity["recipe"],
  #     items: entity["items"] |> Enum.map(&decode_itemstack/1),
  #   }
  # end
  #
  # def decode_icon(%{"index" => index, "signal" => signal} = icon) when map_size(icon)==2 do
  #   {
  #     index,
  #     decode_signal(signal),
  #   }
  # end
  #
  # def decode_signal(%{"name" => name, "type" => type} = signal) when map_size(signal)==2, do: %Signal{name: name, type: type}
  #
  # def decode_itemstack(%{"count" => count, "item" => item} = is) when map_size(is) == 2, do: %ItemStack{count: count, item: item}

end
