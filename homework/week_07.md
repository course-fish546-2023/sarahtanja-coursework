---
title: "Week 07 Questions"
author: "Sarah Tanja"
format: md_document
---

## a) **What is your current grade in the class? How many issues are open in our research repository?**

My current grade in class is **93.31%** on Canvas. I do have missing submissions for Research Project Week02, and a lot of partial credit for Research Project work (which has, admittedly, been slow). Just one issues open in private repo... but recently closed. It was the strange GitHub glitch with Members not being able to view private repos, which must have recently been fixed because i can see private repos now.

## b) **Re-reading this week's reading, what are 2 things that resonate with you now that made little practical sense in week 2. What is one aspect that you still wonder about or is unclear?**

The Table 1. Resources is much more helpful now that I know what the headers like 'Sequence read mapping' and 'Transcriptome sequence assembly and characterization' are. Along with some experience and familiarity with Samtools, DeSeq, Kallisto, HISAT, and Trinity. Because I lacked direct experience using these computational tools, I didn't have a mental image of what they were or what they did when I read this in week 2.

There are still many aspects of the bioinformatics world that are still unclear to me... how to assemble a new genome, how to really talk about annotated/summarized genes in a broader biological context, how to communicate the level of confidence in these analysis (do they have p values?) I'm currently hung up on how to get from a BAM file to read counts.

## c) **What is epigenetics and how could it relate to your own research project?**

Epigenetics is the study of *'mechanisms that can alter expression in a heritable manner without altering the underlying nucleotides themselves\* ([Roberts and Gavery, 2018](https://bioone.org/journals/journal-of-shellfish-research/volume-37/issue-4/035.037.0406/Opportunities-in-Functional-Genomics--A-Primer-on-Lab-and/10.2983/035.037.0406.short)).' It seems the most common epigenetic analysis focuses on DNA methylation and histone modification patterns, something that apparently is possible to catch using Next-generation sequencing (NGS). I wonder what settings you have to use in NGS to catch all that info, or if every sample run on NGS platforms catch those additional data. My own research project is looking at an acute exposure of scleractinian* M. capitata\* corals to heat and pollution stressors, and is going to be relying on Tag-Seq NGS.

ChatGPT says:

> For DNA methylation analysis, tag-seq data can be used to generate methylation profiles by aligning the sequence tags to the reference genome and identifying methylated cytosines in the DNA. This approach is known as bisulfite-tag-seq, and it can be used to map DNA methylation at single-base resolution.
>
> Similarly, for histone modification analysis, tag-seq data can be used to generate profiles of histone marks by aligning the sequence tags to the reference genome and identifying regions enriched for a particular histone mark. This approach is known as ChIP-tag-seq, and it can be used to map the genome-wide distribution of histone modifications.

.. However still not sure what additional steps (other than bisulfate-treating the DNA) are necessary... additional costs for library prep, different type of sequencing service needed? More costly?

## d) **Describe what a GFF file is?**

A General Feature Format (GFF) file is a text file format that stores genomic annotations for features like genes, transcripts, and exons.

Each line in a GFF file represents a single feature, and there are 9 columns for each feature:

1.  Sequence ID: The name of the chromosome or scaffold where the feature is located.

2.  Source: The name of the program or database that generated the feature.

3.  Type: The type of feature, such as "gene", "exon", or "CDS".

4.  Start: The starting position of the feature on the chromosome or scaffold.

5.  End: The ending position of the feature on the chromosome or scaffold.

6.  Score: A score for the feature, if applicable.

7.  Strand: The orientation of the feature on the chromosome or scaffold (+ or -).

8.  Phase: The reading frame of the feature, if applicable.

9.  Attributes: A semicolon-separated list of feature attributes, such as the gene name or transcript ID.

The GFF file format can be used to store and exchange genomic annotations between different bioinformatics tools and databases. It is a flexible format that can be customized to include additional columns or attributes, depending on the needs of the user.

## e) **What are two ways describing CG motifs could have value?**

> [CpG motifs refer to regions in the DNA sequence where a cytosine nucleotide (C) is followed by a guanine nucleotide (G).](https://sr320.github.io/course-fish546-2023/lectures/07-methylation.html#:~:text=CpG%20motifs%20refer%20to%20regions%20in%20the%20DNA%20sequence%20where%20a%20cytosine%20nucleotide%20(C)%20is%20followed%20by%20a%20guanine%20nucleotide%20(G).)

These 'motifs' are rare, prone to mutations, and essential for gene regulation and epigenetic modification.

Characterizing CpG motifs can provide insight into:

1.  **Gene regulation, DNA methylation, & Epigenetic Inheritance**: CpG islands are regions with high densities of CpG motifs, these areas are targets for gene promotors and DNA methylation. These motifs are associated with the important roles of gene expression regulation and genomic imprinting.

2.  **Disease associations & Biomarkers**: Aberrant DNA methylation patterns, often involving CpG motifs, have been linked to various diseases, including cancer, neurological disorders, and autoimmune diseases. CpG motifs can help identify potential biomarkers for disease diagnosis, prognosis, or response to therapy and may inform the development of diagnostic tools and therapeutic interventions.
