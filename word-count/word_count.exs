defmodule Words do
  @doc """
  Count the number of words in the sentence.

  Words are compared case-insensitively.
  """
  @spec count(String.t()) :: map
  def count(sentence) do
    sentence
    |> prepare()
    |> make_map()
  end

  defp prepare(sentence) do
    sentence = String.downcase(sentence)
    sentence = Regex.replace(~r/[@|#|\$|%|&|\^|:|_|!|,]/u, sentence, " ")
    String.split(sentence, " ", trim: true)
  end

  defp make_map(words) do
    Enum.reduce(
      words,
      Map.new(),
      fn (word, map) ->
        Map.update(map, word, 1, &(&1+1))
      end
        )
  end
end
