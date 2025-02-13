defmodule Acronym do
  @doc """
  Generate an acronym from a string.
  "This is a string" => "TIAS"
  """
  @spec abbreviate(String.t()) :: String.t()
  def abbreviate(string) do
    Regex.scan(~r{[A-Z][a-z]+|[a-z]{2,\}|[A-Z]+}, string)
    |> List.flatten
    |> Enum.map(fn word ->
      word
      |> String.at(0)
      |> String.upcase
    end)
    |> Enum.join("")
  end
end
