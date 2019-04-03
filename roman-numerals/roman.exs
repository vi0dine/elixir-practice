defmodule Roman do
  @doc """
  Convert the number to a roman number.
  """
  @romans %{
    1 => "I",
    2 => "II",
    3 => "III",
    4 => "IV",
    5 => "V",
    9 => "IX",
    10 => "X",
    40 => "XL",
    50 => "L",
    90 => "XC",
    100 => "C",
    400 => "CD",
    500 => "D",
    900 => "CM",
    1000 => "M"
  }

  @spec numerals(pos_integer) :: String.t()
  def numerals(number) do
    case number do
      0 -> ""
      1 -> @romans[1]
      2 -> @romans[2]
      3 -> @romans[3]
      4 -> @romans[4]
      number when number < 9 and number >= 5 -> @romans[5] <> numerals(number - 5)
      9 -> @romans[9]
      number when number < 40 and number >= 10 -> @romans[10] <> numerals(number - 10)
      number when number < 50 and number >= 40 -> @romans[40] <> numerals(number - 40)
      number when number < 90 and number >= 50 -> @romans[50] <> numerals(number - 50)
      number when number < 100 and number >= 90 -> @romans[90] <> numerals(number - 90)
      number when number < 400 and number >= 100 -> @romans[100] <> numerals(number - 100)
      number when number < 500 and number >= 400 -> @romans[400] <> numerals(number - 400)
      number when number < 900 and number >= 500 -> @romans[500] <> numerals(number - 500)
      number when number < 1000 and number >= 900 -> @romans[900] <> numerals(number - 900)
      number when number >= 1000 -> @romans[1000] <> numerals(number - 1000)
    end
  end
end
