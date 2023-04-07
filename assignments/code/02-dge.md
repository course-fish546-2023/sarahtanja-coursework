# Differential Gene Expression

<https://sr320.github.io/course-fish546-2023/assignments/02-DGE.html>

For this assignment you will be taking RNA-seq data, and running a
common differential gene expression analysis, without the use of a
reference genome. The end product will be a plot and table of
deferentially expressed genes.

> Kallisto is a pseudo-aligner, it does not need a genome to align to!
> it uses the sequences in the dataset to create it’s own ‘reference’

------------------------------------------------------------------------

## Advance prep: Setup git hooks to automatically gitignore files &gt;100MB

In this assignment we’re dealing with large files that will end up in
the ../data and ../output directories. To prevent those large files from
clogging up our ability to ‘git push’, we can use built-in hooks to
automatically ignore files larger than 100 MB (no matter the directory
or file name!). Here are the steps to follow:

-   Create a new text file in the .git/hooks/ directory of your
    repository called pre-commit. *Select the `More` tab with the gear
    icon under the RStudio Files navigator bar and select ‘show hidden
    files’ to see the .git folder*.

-   Add the following code to the pre-commit file:

<!-- -->

    #!/bin/bash

    # Maximum file size (in bytes)
    max_file_size=104857600

    # Find all files larger than max_file_size and add them to the .gitignore file
    find . -type f -size +$max_file_sizec -exec echo "{}" >> .gitignore \;

This code sets the max\_file\_size variable to 100 MB and then uses the
find command to locate all files in the repository that are larger than
the specified max\_file\_size. The exec option of the find command
appends the name of each file that matches the criteria to the
.gitignore file.

Save the pre-commit file and make it executable by running the following
command in Terminal:

    chmod +x .git/hooks/pre-commit

With these changes, whenever you run a git commit command, Git will
first execute the pre-commit hook, which will automatically add any
files larger than 100 MB to the .gitignore file. This will prevent Git
from tracking these files in the repository going forward.

## ⚠️In the event of a big (&gt;100MB) commit…

> In the event that you accidentally committed a file &gt;100MB, you can
> reset to the last successful git master branch push⚠️**! warning this
> will overwrite any changes you made after your last successful push
> !**⚠️…
>
> If you still want to continue, you can un-comment the code and follow
> <a href="#0"
> style="background-color: transparent; font-size: 11.4pt;">this</a>
> instruction:
>
> First, update all `origin/<branch>` refs to latest:
>
>     #git fetch --all
>
> Backup your current branch (e.g. `master`):
>
>     #git branch backup-master
>
> Jump to the latest commit on `origin/master` :
>
>     #git reset --hard origin/master

------------------------------------------------------------------------

## Running kallisto

[kallisto](https://pachterlab.github.io/kallisto/) is a software that
can be downloaded and unzipped into a `programs` directory outside of
the repo.

In our case, it is already installed on raven
(`/home/shared/kallisto/kallisto`), and can be checked by running the
`version` command as below:

    /home/shared/kallisto/kallisto version

> If you need to download and install kallisto:
>
> 1.  navigate to a `programs` directory outside of the repo
> 2.  grab the applicable program from the
>     [website](https://pachterlab.github.io/kallisto/) using `wget`
> 3.  uncompress the file by navigating to the `programs/kallisto`
>     directory and running `gunzip`
> 4.  check functionality with `index` command as above

------------------------------------------------------------------------

## Downloading Reference

This code grabs the Pacific oyster fasta file of genes and does so
ignoring the fact that *gannet* does not have a security certificate to
authenticate (`--insecure`). This is usually not recommended however we
know the server (i.e. we trust we’re not going to get a virus from this
server).

    # change to work in data directory
    cd ../data
    # download the rna.fna file to data directory from the gannet server
    curl --insecure -O https://gannet.fish.washington.edu/seashell/bu-github/nb-2023/Cgigas/data/rna.fna

In the next code chunk we create the index file which **insert what the
index file is for here**. Creating the index file can take some time (it
is 1.6GB!) This code is indexing the file `rna.fna` while also renaming
it as `cgigas_roslin_rna.index`. `/home/shared/kallisto/kallisto` is the
absolute path to kallisto program, while the lines after the `index`
command indicate where to get the data from (the `rna.fna` file) and
where to write the file to.

    /home/shared/kallisto/kallisto \
    index -i \
    ../data/cgigas_roslin_rna.index \
    ../data/rna.fna

## Download sequence reads

Sequence reads are on a public server at
<https://gannet.fish.washington.edu/seashell/bu-github/nb-2023/Cgigas/data/nopp/>
or located at absolute path
`/home/shared/8TB_HDD_01/sr320/github/nb-2023/Cgigas/data`. This code
uses the `--recursive` feature of `wget` to get all 24 files.
Additionally as with `curl` above we are ignoring the fact there is not
security certificate with `--no-check-certificate`

    # move to data directory
    cd ../data 
    # download fastq files to data directory 
    wget --recursive --no-parent --no-directories \
    --no-check-certificate \
    --accept '*.fastq.gz' \
    https://gannet.fish.washington.edu/seashell/bu-github/nb-2023/Cgigas/data/nopp/

Check to make sure all 24 files were downloaded successfully

    # move to data directory
    cd ../data
    # list all files that end with `.gz` extension, count the files in the list
    ls *.gz | wc -l

The next chunk performs the following steps:

-   creates a subdirectory `kallisto_01` in the `output` folder using
    `mkdir`
-   Uses the `find` utility to search for all files in the `../data/`
    directory that match the pattern `*fastq.gz`.
-   Uses the `basename` command to extract the base filename of each
    file (i.e., the filename without the directory path), and removes
    the suffix `_L001_R1_001.fastq.gz`.
-   Runs the kallisto `quant` command on each input file, with the
    following options:
-   `-i ../data/cgigas_roslin_rna.index`: Use the kallisto index file
    located at `../data/cgigas_roslin_rna.index`.
-   `-o ../output/kallisto_01/{}`: Write the output files to a directory
    called `../output/kallisto_01/` with a subdirectory named after the
    base filename of the input file (the {} is a placeholder for the
    base filename).
-   `-t 40`: Use 40 threads for the computation.
-   `--single -l 100 -s 10`: Specify that the input file contains
    single-end reads (–single), with an average read length of 100
    (-l 100) and a standard deviation of 10 (-s 10).
-   The input file to process is specified using the {} placeholder,
    which is replaced by the base filename from the previous step.

<!-- -->


    # mkdir ../output/kallisto_01

    find ../data/*fastq.gz \
    | xargs basename -s _L001_R1_001.fastq.gz | xargs -I{} /home/shared/kallisto/kallisto \
    quant -i ../data/cgigas_roslin_rna.index \
    -o ../output/kallisto_01/{} \
    -t 40 \
    --single -l 100 -s 10 ../data/{}_L001_R1_001.fastq.gz

This next command runs the `abundance_estimates_to_matrix.pl` script
from the Trinity RNA-seq assembly software package to create a gene
expression matrix from kallisto output files.

The specific options and arguments used in the command are as follows:

-   `perl /home/shared/trinityrnaseq-v2.12.0/util/abundance_estimates_to_matrix.pl`:
    Run the abundance\_estimates\_to\_matrix.pl script from Trinity.
-   `--est_method kallisto`: Specify that the abundance estimates were
    generated using kallisto.
-   `--gene_trans_map none`: Do not use a gene-to-transcript mapping
    file.
-   `--out_prefix ../output/kallisto_01`: Use ../output/kallisto\_01 as
    the output directory and prefix for the gene expression matrix file.
-   `--name_sample_by_basedir`: Use the sample directory name (i.e., the
    final directory in the input file paths) as the sample name in the
    output matrix.
-   And then there are the kallisto abundance files to use as input for
    creating the gene expression matrix.

<!-- -->


    perl /home/shared/trinityrnaseq-v2.12.0/util/abundance_estimates_to_matrix.pl \
    --est_method kallisto \
        --gene_trans_map none \
        --out_prefix ../output/kallisto_01 \
        --name_sample_by_basedir \
        ../output/kallisto_01/D54_S145/abundance.tsv \
        ../output/kallisto_01/D56_S136/abundance.tsv \
        ../output/kallisto_01/D58_S144/abundance.tsv \
        ../output/kallisto_01/M45_S140/abundance.tsv \
        ../output/kallisto_01/M48_S137/abundance.tsv \
        ../output/kallisto_01/M89_S138/abundance.tsv \
        ../output/kallisto_01/D55_S146/abundance.tsv \
        ../output/kallisto_01/D57_S143/abundance.tsv \
        ../output/kallisto_01/D59_S142/abundance.tsv \
        ../output/kallisto_01/M46_S141/abundance.tsv \
        ../output/kallisto_01/M49_S139/abundance.tsv \
        ../output/kallisto_01/M90_S147/abundance.tsv \
        ../output/kallisto_01/N48_S194/abundance.tsv \
        ../output/kallisto_01/N50_S187/abundance.tsv \
        ../output/kallisto_01/N52_S184/abundance.tsv \
        ../output/kallisto_01/N54_S193/abundance.tsv \
        ../output/kallisto_01/N56_S192/abundance.tsv \
        ../output/kallisto_01/N58_S195/abundance.tsv \
        ../output/kallisto_01/N49_S185/abundance.tsv \
        ../output/kallisto_01/N51_S186/abundance.tsv \
        ../output/kallisto_01/N53_S188/abundance.tsv \
        ../output/kallisto_01/N55_S190/abundance.tsv \
        ../output/kallisto_01/N57_S191/abundance.tsv \
        ../output/kallisto_01/N59_S189/abundance.tsv
        
