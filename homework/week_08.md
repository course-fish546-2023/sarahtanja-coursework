Week 08 Questions
================
Sarah Tanja
5/16/23

## 

## **a. What is a genomic range and what 3 types of information do you need for a range?**

Genomic ranges are *‘integer intervals that represent a subsequence of
consecutive positions on a sequence like a chromosome’* (Bioinformatics
Data Skills, Chapter 9: Working with Range Data, pg. 264). They
represent regions of a genome using a numbered base-pair start and stop
position. In order to correctly describe a range, you need to provide
the following:

- Genome version

  - genomic locations and ranges are relative to reference genomes, so
    you have to specify which genome version you are using

- Chromosome name (or sequence name)

  - each genome is made up of a set of chromosome sequences, so you have
    to specify which one a range is on

- Strand (forward or reverse)

  - chromosomal DNA is double-stranded, and features can be
    strand-specific and reside on either the forward (+) or reverse (-)
    strands

- Range $$start, end) or \[start, end$$

  - base-pair integer range in either 0-based (indexed) or 1-based
    (indexed)

## **b. What does 0-based and 1-based refer to? What are the advantages and disadvantages of each?**

0-based or 1-based coordinate systems refer to how you describe the
range. 0-based starts counting the first base-pair as 0, while 1-based
starts counting the first base-pair at 1. In the 0-based coordinate
system, the start base pair is included in the range, but the end base
pair is excluded.

<table>
<colgroup>
<col style="width: 54%" />
<col style="width: 45%" />
</colgroup>
<tbody>
<tr class="odd">
<td>0-based</td>
<td>1-based</td>
</tr>
<tr class="even">
<td><ul>
<li>starts at 0 [start, end)</li>
<li>[<em>included</em> , <em>excluded</em> )</li>
<li>half closed, half open intervals</li>
<li>Python</li>
<li>zero-width features [12, 12) <em>features between bases</em></li>
<li><span
class="math inline"><em>r</em><em>a</em><em>n</em><em>g</em><em>e</em> <em>w</em><em>i</em><em>d</em><em>t</em><em>h</em> = <em>e</em><em>n</em><em>d</em> − <em>s</em><em>t</em><em>a</em><em>r</em><em>t</em></span></li>
<li><code>BEDTools</code></li>
<li><code>BAM</code></li>
</ul></td>
<td><ul>
<li>starts at 1 [start, end]</li>
<li>[<em>included</em>, <em>included</em>]</li>
<li>closed intervals</li>
<li>R</li>
<li>zero-width features <em>features between bases</em></li>
<li><span
class="math inline"><em>r</em><em>a</em><em>n</em><em>g</em><em>e</em> <em>w</em><em>i</em><em>d</em><em>t</em><em>h</em> = <em>e</em><em>n</em><em>d</em> − <em>s</em><em>t</em><em>a</em><em>r</em><em>t</em> + 1</span></li>
<li><code>GenomicRanges</code></li>
<li><code>GTF</code></li>
<li><code>GFF</code></li>
<li><code>SAM</code></li>
</ul></td>
</tr>
</tbody>
</table>

## **c. What is the value of `BEDtools` over the bioconductor package `GenomicRange`?**

`GenomicRanges` has cool visuals and interactive features, but requires
that you load in all the data and uses lots of memory. In contrast, the
`BEDTools` suite uses command-line tools that work directly in the data
range file formats like BED, BAM, GTF, and GFF.

## **d. Describe one subcommand of the `BEDtools` suite as well as a practical use case.**

Cpmputing overlaps using `bedtools intersect` is one of the most
commonly used range-based operations in bioinformatics. This command
computes the overlap between two sets of ranges. `BEDTools` labels
ranges ‘a’ and ‘b’, so the `-a` and `-b` options are used to specify the
input range files, which can be in BED, BAM, GTF, or GFF format.
