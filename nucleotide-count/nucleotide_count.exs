defmodule NucleotideCount do
  @nucleotides [?A, ?C, ?G, ?T]

  @doc """
  Counts individual nucleotides in a DNA strand.

  ## Examples

  iex> NucleotideCount.count('AATAA', ?A)
  4

  iex> NucleotideCount.count('AATAA', ?T)
  1
  """
  @spec count([char], char) :: non_neg_integer
  def count(strand, nucleotide) do
    Enum.reduce(strand, 0, fn nucleo, acc ->
      if nucleo == nucleotide do
        acc + 1
      else
        acc
      end
    end
    )
  end

  @doc """
  Returns a summary of counts by nucleotide.

  ## Examples

  iex> NucleotideCount.histogram('AATAA')
  %{?A => 4, ?T => 1, ?C => 0, ?G => 0}
  """
  @spec histogram([char]) :: map
  def histogram(strand) do
    strand
    |> Enum.reduce(
        %{?A => 0, ?T => 0, ?C => 0, ?G => 0},
        fn nucleo, acc ->
          Map.update(acc, nucleo, 1, &(&1 + 1))
        end
    )
  end
end
