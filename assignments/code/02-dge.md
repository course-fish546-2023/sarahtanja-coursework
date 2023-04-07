# Differential Gene Expression

<https://sr320.github.io/course-fish546-2023/assignments/02-DGE.html>

For this assignment you will be taking RNA-seq data, and running a
common differential gene expression analysis, without the use of a
reference genome. The end product will be a plot and table of
deferentially expressed genes.

> Kallisto is a pseudo-aligner, it does not need a genome to align to!
> it uses the sequences in the dataset to create it’s own ‘reference’

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

# Step 1. Download fastq.gz files

Download all the fastq.gz files (this takes a long time!)

    # navigate to the /data directory
    cd ../data
    # download fastq.gz files using wget 
    wget --recursive --no-parent --no-directories --no-check-certificate\
    --accept '[DMN]\*001.fastq.gz'\
    https://owl.fish.washington.edu/nightingales/C_gigas/

## Step 2. Install Kallisto

For this assignment we will be using kallisto (bash), DESeq2 (r).

Create a directory in your home directory (outside of git repo) named
`programs`, then use `wget` to download zipped program software into the
`programs` directory

    pwd
    cd ../../../../
    mkdir programs
    cd programs 
    wget https://github.com/pachterlab/kallisto/releases/download/v0.46.1/kallisto_linux-v0.46.1.tar.gz

Unzip the file

    gunzip ~/sarahtanja/programs/kallisto_linux-v0.46.1.tar.gz

## Step 3. Running kallisto

Kallisto is already installed on raven
(`/home/shared/kallisto/kallisto`) &gt; Note: Cannot find `shared`
folder under /home in raven… 04APR23

    /home/shared/kallisto/kallisto index

## Step 4. Downloading Reference

    # change to work in data directory
    cd ../data
    # download fna file to data directory
    wget --no-check-certificate https://gannet.fish.washington.edu/seashell/bu-github/nb-2023/Cgigas/data/rna.fna

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
