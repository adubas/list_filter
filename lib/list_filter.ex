defmodule ListFilter do
  @moduledoc """
  Documentation for `ListFilter`.
  """
  require Integer

  def call(list) when is_list(list) do
    Enum.reduce(list, 0, fn
      string, acc ->
        case is_odd?(string) do
          true -> acc + 1
          false -> acc
          :error -> :invalid_list
        end
    end)
  end

  def call(_invalid), do: :invalid_argument

  defp is_odd?(string) when is_binary(string) do
    if String.match?(string, ~r/\d/) do
      string
      |> String.to_integer()
      |> Integer.is_odd()
    else
      false
    end
  end

  defp is_odd?(_list_item), do: :error
end
