defmodule StringSeries do
  @doc """
  Given a string `s` and a positive integer `size`, return all substrings
  of that size. If `size` is greater than the length of `s`, or less than 1,
  return an empty list.
  """
  @spec slices(s :: String.t(), size :: integer) :: list(String.t())
  def slices(s, size) do
    cond do
      String.length(s) < size -> []
      size < 1 -> []
      true -> slice_string(s, size)
    end
  end

  defp slice_string(s, size) do
    Enum.reduce(0..String.length(s), [], fn index, acc ->
      List.insert_at(acc, length(acc), s |> String.slice(index, size))
    end)
    |> Enum.filter(& String.length(&1) == size)
  end
end
