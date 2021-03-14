defmodule TwelveDays do
  @gifts ["a Partridge in a Pear Tree", "Turtle Doves", "French Hens", "Calling Birds",
            "Gold Rings", "Geese-a-Laying", "Swans-a-Swimming", "Maids-a-Milking",
            "Ladies Dancing", "Lords-a-Leaping", "Pipers Piping", "Drummers Drumming"]

  @doc """
  Given a `number`, return the song's verse for that specific day, including
  all gifts for previous days in the same line.
  """
  @spec verse(number :: integer) :: String.t()
  def verse(number) do
    beginning = "On the #{number_to_ordinal(number)} day of Christmas my true love gave to me: "

    Enum.take(@gifts, number)
    |> Enum.with_index(1)
    |> Enum.reverse
    |> Enum.reduce(beginning, fn {gift, index}, acc ->
      if number == 1 do
        "#{beginning}#{number_to_string(index)}#{gift}."
      else
        case index do
          1 -> acc <> "and #{number_to_string(index)}#{gift}."
          _ -> acc <> "#{number_to_string(index)} #{gift}, "
        end
      end
    end)
  end

  @doc """
  Given a `starting_verse` and an `ending_verse`, return the verses for each
  included day, one per line.
  """
  @spec verses(starting_verse :: integer, ending_verse :: integer) :: String.t()
  def verses(starting_verse, ending_verse) do
    Enum.reduce(starting_verse..ending_verse, "", fn verse_num, acc ->
      cond do
        verse_num == ending_verse -> acc <> verse(verse_num)
        true -> acc <> verse(verse_num) <> "\n"
      end
    end)
  end

  @doc """
  Sing all 12 verses, in order, one verse per line.
  """
  @spec sing() :: String.t()
  def sing do
    Enum.reduce(1..length(@gifts), "", fn verse_num, acc ->
      cond do
        verse_num == 12 -> acc <> verse(verse_num)
        true -> acc <> verse(verse_num) <> "\n"
      end
    end)
  end

  defp number_to_ordinal(number) do
    case number do
      1 -> "first"
      2 -> "second"
      3 -> "third"
      4 -> "fourth"
      5 -> "fifth"
      6 -> "sixth"
      7 -> "seventh"
      8 -> "eighth"
      9 -> "ninth"
      10 -> "tenth"
      11 -> "eleventh"
      12 -> "twelfth"
    end
  end

  defp number_to_string(number) do
    case number do
      1 -> ""
      2 -> "two"
      3 -> "three"
      4 -> "four"
      5 -> "five"
      6 -> "six"
      7 -> "seven"
      8 -> "eight"
      9 -> "nine"
      10 -> "ten"
      11 -> "eleven"
      12 -> "twelve"
    end
  end
end
