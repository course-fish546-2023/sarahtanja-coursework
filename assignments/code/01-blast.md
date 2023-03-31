---
title: "blast"
author: "Sarah Tanja"
date: "3/31/2023"
output: html_document
---

This assignment is to take set of unknown sequences, and annotate them with GO terms.

> Environment:
>
> -   Windows Surface Pro
>
> -   Chrome browser
>
> -   [JupyterHub Instance](https://jupyter.rttl.uw.edu/2023-spring-fish-546-a), remote RStudio server

### Step 1. Download Software

Open the remote RStudio server through [JupyterHub Instance](https://jupyter.rttl.uw.edu/2023-spring-fish-546-a){style="font-size: 11.4pt;"}.

Navigate to the [NCBI blast downloads](https://ftp.ncbi.nlm.nih.gov/blast/executables/blast+/LATEST/){style="font-size: 11.4pt;"} page, and copy [the link]{.underline} to the software ***for your operating system***. This is an important first step! Here I choose \`[ncbi-blast-2.13.0+-x64-linux.tar.gz](https://ftp.ncbi.nlm.nih.gov/blast/executables/blast+/LATEST/ncbi-blast-2.13.0+-x64-linux.tar.gz)\` because I am working in a Linux OS environment through the cloud instance of UW's JupyterHub, which operates a Linux OS.

![software download for NCBI blast](ncbiblastdownload.png)

We are going to first try to downloaded the [ncbi-blast-2.13.0+-x64-linux.tar.gz](https://ftp.ncbi.nlm.nih.gov/blast/executables/blast+/LATEST/ncbi-blast-2.13.0+-x64-linux.tar.gz) , and we'll do this not by 'clicking' on the file and downloading it locally to your computer, but by downloading it using the `curl -O` bash command and placing it in a new folder we'll create named 'applications' outside of the repository.

> Note: When you start a bash code chunk the present working directory always starts over in the location of the file that you are working from

```{bash}
# check present working directory
pwd
```

Download the software using `curl -O`

```{bash}
# navigate to outside of git repo directory using relative paths
cd ../../../../

# make application directory (will throw an error if already made once
# comment out `mkdir applications` if this is the case)
# mkdir applications

# switch into applications directory
cd applications

# curl (download from the internet) the NCBI software
curl -O https://ftp.ncbi.nlm.nih.gov/blast/executables/blast+/LATEST/ncbi-blast-2.13.0+-x64-linux.tar.gz

# tar unzip software with `tar -xf`
tar -xf ncbi-blast-2.13.0+-x64-linux.tar.gz
```

> Note: The `~` command specifies a file to run a program or command on... it does not change you to that directory space! The `-h` command displays help when placed after a specified file

```{bash}
~/applications/ncbi-blast-2.13.0+/bin/blastx -h
```

### Step 2. Make Blast Database

Before this step we want to make sure there is an assignments/data directory, and to add `assignments/data/*.f*` to the .gitignore file, since we will be downloading large fasta files to the folder, these files are too large to commit to GitHub (exceeding the max file size), and will result in errors if not included in the .gitignore file.

> Note: add `assignments/data/*.f*` to the .gitignore file

see <https://www.uniprot.org/downloads>

```{bash}

# check present working directory
pwd

# change into assignments/data directory
cd ../data

# download fasta.gz files from uniprot
curl -O https://ftp.uniprot.org/pub/databases/uniprot/current_release/knowledgebase/complete/uniprot_sprot.fasta.gz

# use the 'move' `mv` command to rename uniprot_sprot to include info on year & assignment number
mv uniprot_sprot.fasta.gz uniprot_sprot_r2023_01.fasta.gz

# unzip file (zipped by `gz`.. so unzip with `gunzip`..something something)
gunzip -k uniprot_sprot_r2023_01.fasta.gz

# list the files in the data directory to check that they are there with the right names
ls ../data
```

This code chunk will make the blast database.

> Note: add `assignments/blastdb` to the .gitignore file

```{bash}
# Use the ncbi-blast software 'makeblastdb' and run chain of commands to make a database using the fasta files in a new blastdb folder
~/applications/ncbi-blast-2.13.0+/bin/makeblastdb \
-in ../data/uniprot_sprot_r2023_01.fasta \
-dbtype prot \
-out ../blastdb/uniprot_sprot_r2023_01
```