## Week 02 Question Set

a)  **What do you feel was the most impressive thing you did in class last week was?**

    I'm impressed that I was able to get stuck on step #1 for the entire class; by downloading the wrong ncbi blast software. Outside of class, I set up a local host RStudio server on WSL, and I'm pretty happy with learning how to do that.

b)  **What is your weekly goal for making progress on your project? What is the next step?**

    weekly goal :

    [ ] get a grasp of the RNAseq workflow from Ariana's lecture this week

    [ ] get some 'fake data' for M. capitata to start working with

    [ ] setup WSL & remote Rstudio server on home gaming desktop

    next step:

    [ ] begin scaffold my RNAseq script using what I learned in the [in-class DGE](https://sr320.github.io/course-fish546-2023/assignments/02-DGE.html) assignment & fake data

c)  **There were two readings this week not from the textbook, meant for two different audiences. Which reading did you get the most out of and why? Do you have any questions regarding the Journal of Shellfish Research paper?**

    It was key that I read the primer review paper before the [multifactorial model fitting post](https://marineomics.github.io/FUN_01_DGE_comparison_v2.html). I think the multifactorial model fitting post was most useful to me, because it mirrors what I will need to do in my own project to assess PAE pollution concentrations and thermal stress. However, I understood fully 40-50% of it... The review paper gave me an orientation of the broad steps, the multifactorial post gave me a glimpse of where I still need to fill in knowledge gaps.

d)  **What is your favorite thing about markdown and why?**

    My favorite thing about markdown is not having to use Word. I hate how Word text does not integrate well with images, and page breaks. Markdown is an 'infinately long canvas' with no breaks and top to bottom flow. It helps with my train of thought and visual organization.

e)  **What is the difference between `curl` and `wget`? When would you used one over the other?**

    `wget` is useful for quickly downloading via HTTP or FTP and scraping data from a web page using its recursive option (meaning it can download all the links within the url too, and there is a parameter for how many levels down to 'scrape').

    `curl` behaves similarly, but can download via SFTP (secure FTP) and using SCP (secure copy) protocols. By default `curl` writes the file to standard output (meaning it prints to the terminal).

    In summary, `curl` is a more versatile tool for downloading files with a wide range of protocols and features, while `wget` is more focused on recursive downloading and mirroring of websites.

    You might use `wget` to download a suite of files from a webpage, and `curl` to download a file that has a secure fil transfer protocol (SFTP).
