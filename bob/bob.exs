defmodule Bob do
  def hey(input) do
    cond do
      is_silence?(input) -> "Fine. Be that way!"
      is_question?(input) && is_shouting?(input) -> "Calm down, I know what I'm doing!"
      is_question?(input) -> "Sure."
      is_shouting?(input) -> "Whoa, chill out!"
      true -> "Whatever."
    end
  end

  defp is_silence?(input) do
    String.trim(input) == ""
  end

  defp is_question?(input) do
    String.ends_with?(input, "?")
  end

  defp is_shouting?(input) do
    String.upcase(input) == input && String.upcase(input) != String.downcase(input)
  end

end
