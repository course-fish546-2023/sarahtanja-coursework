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
`index` command as below:

    /home/shared/kallisto/kallisto index

    ## 
    ## kallisto 0.46.1
    ## Builds a kallisto index
    ## 
    ## Usage: kallisto index [arguments] FASTA-files
    ## 
    ## Required argument:
    ## -i, --index=STRING          Filename for the kallisto index to be constructed 
    ## 
    ## Optional argument:
    ## -k, --kmer-size=INT         k-mer (odd) length (default: 31, max value: 31)
    ##     --make-unique           Replace repeated target names with unique names

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
know the server.

    # change to work in data directory
    cd ../data
    # download fna file to data directory
    wget https://gannet.fish.washington.edu/seashell/bu-github/nb-2023/Cgigas/data/rna.fna

creating an index

    # use absolute path to kallisto program
     /home/shared/kallisto/kallisto \
    # create an index and name it (-i) `cgigas_roslin_rna.index`
    index -i \
    ../data/cgigas_roslin_rna.index \
    # here is the absolute path to the RNAseq data (fasta files)
    /home/shared/8TB_HDD_01/sr320/github/nb-2023/Cgigas/data

## Step 5. Download sequence reads

data is located at absolute path
`/home/shared/8TB_HDD_01/sr320/github/nb-2023/Cgigas/data`

    # make kallisto_01 directory in output directorty
    # comment out once directory is made

    #cd ../output
    #mkdir kallisto_01

    # replace data location with absolute path above
    #find ../data/*fastq.gz \ # take the data

    find /home/shared/8TB_HDD_01/sr320/github/nb-2023/Cgigas/data \
    | xargs basename -s _R1_001.fastq.gz | xargs -I{} /home/shared/kallisto/kallisto \
    quant -i ../data/cgigas_roslin_rna.index \
    -o ../output/kallisto_01/{} \
    -t 40 \
    --single -l 100 -s 10 ../data/{}_L001_R1_001.fastq.gz
