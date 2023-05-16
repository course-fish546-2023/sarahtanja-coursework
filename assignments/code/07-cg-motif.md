07-cg-motif
================
Sarah Tanja
5/11/23

# [CG Motifs Assignment](https://sr320.github.io/course-fish546-2023/assignments/07-CG.html#cg-motifs)

For this assignment you will take ~~10~~ *8* sequences related to your
project, ID CG motifs using the emboss package: `fuzznuc`, and visualize
in IGV. You do not have to follow this workflow exactly, but it is
provided here for guidance. This uses R package `seqinr`.

``` r
if ("seqinr" %in% rownames(installed.packages()) == 'FALSE') install.packages("seqinr")
library(seqinr)
```

``` r
# Replace 'input.fasta' with the name of your multi-sequence fasta file
sequences <- read.fasta("https://gannet.fish.washington.edu/seashell/bu-546/stanja/sarahtanja/sarahtanja-coralRNA/data/Montipora_capitata_HIv3.genes.cds.fna")
```

``` r
# Set the seed for reproducibility (optional)
set.seed(42)

number_of_sequences_to_select <- 10

if (length(sequences) < number_of_sequences_to_select) {
  warning("There are fewer than 10 sequences in the fasta file. All sequences will be selected.")
  number_of_sequences_to_select <- length(sequences)
}

selected_indices <- sample(length(sequences), number_of_sequences_to_select)
selected_sequences <- sequences[selected_indices]
```

``` bash
selected_sequences  
```

``` r
# Replace 'output.fasta' with your desired output file name
output_file <- "../output/mcap.fasta"
write.fasta(selected_sequences, names(selected_sequences), output_file, open = "w")
```

``` bash
#likely will not need; fix issue where gff and fa name did not match
# sed -i 's/>lcl|/>/g' ../output/10_seqs.fa
```

``` bash
#needed downstream for IGV
/home/shared/samtools-1.12/samtools faidx \
../output/8_mcap_seqs.fa
```

``` bash
fuzznuc -sequence ../output/8_mcap_seqs.fa -pattern CG -rformat gff -outfile ../output/CGoutput.gff
```
