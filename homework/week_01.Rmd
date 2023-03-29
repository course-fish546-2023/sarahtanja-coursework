---
title: "week_01"
author: "Sarah Tanja"
date: "`r Sys.Date()`"
output: html_document
---

# Week 01 Question Set

#### 1. What is your prior experience in this discipline?

I audited an intro bioinformatics course taught by Dr. Jesse Zaneveld, the course material, [Full Spectrum Bioinformatics](https://github.com/zaneveld/full_spectrum_bioinformatics), is hosted in a github repo. This class focused solely on microbiome datasets, and used Jupyter Notebooks, Python, and QIIME2 for the workflow. I tried to follow along on my own by watching recorded lectures... with limited success. I walked through a few [QIIME2 tutorials](https://docs.qiime2.org/2023.2/), and originally setup a VirtualBox virtual machine on my PC to operate Ubuntu... however this was super slow and I ran into a lot of issues with the VirtualBox, and decided to switch to Windows Subsystem for Linux (WSL).

#### 2. What do you hope to get out of this class?

Scripts for RNAseq that I can use for my Master's thesis. It would be a bonus to also work toward my microbiome scripts... but I think RNAseq is more the flavor of this quarter based on instructor expertise and what others in the class will be troubleshooting/working toward.

I also hope to learn about Large File Storage, and cloud computing! I got stumped (and stuck) in the microbiome tutorials when I had to start working with really large files. I want to learn how to access resources at UW for working with large files.

#### 3. This class is strongly rooted in an independent project related to genomic analyses. What specific project do you have in mind? If you do not have any data or preference, data can be provided / acquired. If you do not have a specific project, what approach would you like to master as part of this class?

I am taking this class to work on my Master's thesis project, which is a multiple stressor (heat-wave stress + phthalate pollution) experiment on *Montipora capitata* sclerectinian coral fragments. Unfortunately... everything takes longer for me than I think it will. My goal was to have RNAseq data at the start of this quarter... but I'm still waiting on some supplies to be able to do RNA extractions on my samples. I think it's best if I start out with some 'fake data' to get rolling, and when I do get my own data back I can swap in my data to the script/workflow.

#### 4. What are two things you found most useful from the reading?

Use relative paths! I worked on a project where I was trying to run hexadecimal data through a translation script in Python, and the script had been written by a coworker with their absolute paths... and they were a Mac user and I was a PC user. So on top of having to rewrite every path, I had to flip every '/' to '\\' ... I think I eventually found a bit of code that you put in front of the path that translates it based on your operating system... but that was a big pain.
