defmodule ProteinTranslation do
  @doc """
  Given an RNA string, return a list of proteins specified by codons, in order.
  """

  @proteins %{
    "UGU" => "Cysteine",
    "UGC" => "Cysteine",
    "UUA" => "Leucine",
    "UUG" => "Leucine",
    "AUG" => "Methionine",
    "UUU" => "Phenylalanine",
    "UUC" => "Phenylalanine",
    "UCU" => "Serine",
    "UCC" => "Serine",
    "UCA" => "Serine",
    "UCG" => "Serine",
    "UGG" => "Tryptophan",
    "UAU" => "Tyrosine",
    "UAC" => "Tyrosine",
    "UAA" => "STOP",
    "UAG" => "STOP",
    "UGA" => "STOP"
  }

  @spec of_rna(String.t()) :: {atom, list(String.t())}
  def of_rna(rna) do
    rna
    |> String.codepoints()
    |> Enum.chunk_every(3)
    |> Enum.map(&Enum.join/1)
    |> Enum.reduce_while([], &translate/2)
    |> case do
      err = {:error, _} -> err
      proteins ->
        proteins = Enum.reverse(proteins)
        {:ok, proteins}
    end
  end

  defp translate(codon, acc) do
    case @proteins[codon] do
      "STOP" ->
         {:halt, acc}

      nil ->
         {:halt, {:error, "invalid RNA"}}

      protein ->
         {:cont, [protein | acc]}
    end
  end

  @doc """
  Given a codon, return the corresponding protein

  UGU -> Cysteine
  UGC -> Cysteine
  UUA -> Leucine
  UUG -> Leucine
  AUG -> Methionine
  UUU -> Phenylalanine
  UUC -> Phenylalanine
  UCU -> Serine
  UCC -> Serine
  UCA -> Serine
  UCG -> Serine
  UGG -> Tryptophan
  UAU -> Tyrosine
  UAC -> Tyrosine
  UAA -> STOP
  UAG -> STOP
  UGA -> STOP
  """
  @spec of_codon(String.t()) :: {atom, String.t()}
  def of_codon(codon) do
    unless @proteins[codon] == nil do
      {:ok, @proteins[codon]}
    else
      {:error, "invalid codon"}
    end
  end
end
