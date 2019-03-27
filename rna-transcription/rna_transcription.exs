defmodule RNATranscription do
  @doc """
  Transcribes a character list representing DNA nucleotides to RNA

  ## Examples

  iex> RNATranscription.to_rna('ACTG')
  'UGAC'
  """
  @nucleotides %{
        ?G => ?C,
        ?C => ?G,
        ?T => ?A,
        ?A => ?U
  }

  @spec to_rna([char]) :: [char]
  def to_rna(dna) do
    Enum.map(dna, &get_rna_nucleotide/1)
  end

  defp get_rna_nucleotide(dna_nucleotide) do
    @nucleotides[dna_nucleotide]
  end
end
