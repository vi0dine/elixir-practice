defmodule RotationalCipher do
  @doc """
  Given a plaintext and amount to shift by, return a rotated string.

  Example:
  iex> RotationalCipher.rotate("Attack at dawn", 13)
  "Nggnpx ng qnja"
  """
  @spec rotate(text :: String.t(), shift :: integer) :: String.t()
  def rotate(text, shift) do
    map = Map.new
    |> set_map(?a..?z, shift)
    |> set_map(?A..?Z, shift)
    String.graphemes(text)
    |> Enum.map_join(fn c -> Map.get(map, c, c) end)
  end

  defp set_map(map, range, key) do
    org = Enum.map(range, &List.to_string [&1])
    {a, b} = Enum.split(org, key)
    Enum.zip(org, b ++ a)
    |> Enum.into(map)
  end
end
