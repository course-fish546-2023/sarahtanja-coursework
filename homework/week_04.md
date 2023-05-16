Week 04 Questions
================
Sarah Tanja
4/18/2023

1)  **What is `tmux` and how does this relate to our current way of
    working on raven?**

`tmux` is terminal multiplexing in Unix (or Unix-like) Operating Systems
(OS). It allows multiple ‘terminals’ or ‘windows’ to be accessed
simultaneously, and to run independent of each other. It relates to our
work on the `raven` server because when each of us is using our own
account and working on our own terminal on the same machine it must be
doing it through something like `tmux`.

2)  **What is `ssh` and what would the code be you would type if you
    were going to `ssh` into raven?**

`ssh` is secure shell, and is an encrypted network protocol for
connecting to a computer. It allows remote login and unix-based command
line execution.

To connect to `raven` I would type:

``` bash
ssh stanja@raven.fish.washington.edu
```

To connect to `mox-hyak` I would type:

``` bash
ssh stanja@mox.hyak.uw.edu
```

3)  **What has been the most challenging part of your research project?
    Are you happy with your organization skills? If not what could be
    improved?**

The most challenging part is getting my own data… but aside from that
(and related to this course) I’ve been struggling a little with hashes.
I downloaded some metadata from Ariana Huffmyer’s GitHub repo and have
been using `md5sum` to check it… while the .csv files are the same, the
hash on one is off by a single hexadecimal character.

Am I happy with my organizational skills? Yes. However, I find I spend a
lot of time, maybe too much time, trying to research ‘The Way’ to do
something, and there are so many options and no clear best. As soon as I
learn about one option, another pops onto my RADAR that seems better. I
think I can improve this by just sticking with what I’ve got instead of
constantly trying to re-work what I’ve already done into something else
(i.e. shifting RMarkdown to Quarto, shifting Jekyll open lab notebook to
a Quarto blog).

3)  **For last weeks assignment what did you appreciate the most about
    knitting documents?**

`cache=TRUE` was a really useful chunk option to learn about! It makes
it so that you can display output like pretty graphs without re-running
those long processes.
