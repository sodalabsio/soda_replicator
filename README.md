# Introduction
This repository contains a template for a reproducible research project. The focus lies on quantitative social science. Recommendations might not fully apply to other fields.

Download the template at the start of each new research project. The purpose is to ensure the reproducibility of your analyses from day one with little effort. That does not mean following journals' replication package structure throughout the project, but to have a system in place from which you can produce a replication package with little effort.

Whereas a journal replication package is the final project state bundled into a single unit and extensively documented, earlier stages often benefit from a more modular structure. You probably want to manage your code with Git, but you obviously do not upload terabytes of data to GitHub. Furthermore, it is usually inefficient to maintain the extensive, clunky journal replication package documentation from the start of the project. Rather have a setup which allows you to quickly generate that documentation when needed.

While most recommendations here are agnostic of your choice of data science and typesetting language, this readme adds some language-specific comments in a section below.

# Directory Structure
Before we discuss the directory structure, it is important to stress that you are not meant to use the template as a single Git repository. We host the three separate folders (`data`, `quant`, and `markup` jointly in one place so that you can download them in one go and have a good overview of the entire structure. In your project, you administer them as distinct repositories (`quant` and `markup`) and one non-Git folder (`data`) located in one parent directory.

To summarize the contents: `data` holds the data, `quant` holds the quantitative analysis code, and `markup` holds the markup code.

## Data
The `data` directory holds the project's data sets. Raw input data, as downloaded from the source or as collected in an experiment, goes into `data/raw`. Processed, evaluation-ready data belongs into `data/analysis`. In projects with long data cleaning pipelines, it might make sense to add a `data/intermediate` folder.

As already mentioned, Git is designed for code, not for large data sets. It is a good idea to store the data in a folder synced to the cloud, but not to manage it with Git.

If there are multiple input data sets, each of them should have its separate directory in `data/raw`. The template contains two fictional examples: population data downloaded from `example.com` and weather data downloaded from `example.org`. The data set publisher's documentation, sometimes referred to as code book, and a text file documenting the download URL and the download date should accompany the data files. Online resources can change over time. Hence, store all of this information together in one location from the start.

Similarly, different sets of analysis data can be organized into multiple folders in `data/analysis`. They do, of course, not require extra documentation on where they came from or on which day they were created. The information on how to create the files from the raw data belongs into the `quant` directory. And that code should produce the analysis data irrespective of the execution date. It is a good habit to document the analysis data files in that code because (i) this checks the documentation into version control and (ii) it keeps the explanations close to the logic creating the data.

## Quant
The quantitative analysis code, covering all steps from the raw data to the results shown in the paper, belong into the `quant` directory. This is your R, Python, Stata, Julia, C++ code. It should be managed with Git.

The preprocessing steps turning the `data/raw` into the `data/analysis` files are in `quant/preprocess` and the steps deriving insights from the `data/analysis` data are in `quant/analysis`. You should, especially in larger projects, further divide the `quant/preprocess` and `quant/analysis` into sub-folders. You could have one folder per input data set in `quant/preprocess`, in which you do all the preprocessing of the respective data set. In a file at the `quant/preprocess` level (not in a sub-directory), you then only merge the data. This template illustrates this with example files.

The advantage of placing `quant` in the same parent directory as `data` is that you can easily reference data sets using relative paths. No paths have to be adjusted when running the code from another computer. `../data/raw/population/population.csv` remains valid.

## Markup
The generic term _markup_ covers, e.g., LaTeX and Markdown, and hence the code that you typeset your paper in. This folder is only relevant to people who write their manuscripts locally. Overleaf users who host their projects entirely on that platform and do not sync them with Dropbox do not need this folder.

As in the case of `quant`, you should control the contents of the `markup` directory with Git - as long as you use a markup language. Students who are not yet familiar with LaTeX or Markdown and still use a word processor like Microsoft Word or Libre Office Writer may not experience large benefits from using Git.

`markup` entails three sub-folders: `draft`, `results`, and `presentation`. Throughout the life cycle of a project, there are exploratory phases. You want to try out different empirical models to identify the underlying pattern in the data, and you experiment with theory to craft a framework that your estimations fit into. The `results` folder is the location to collect and discuss ideas. It is the foundation for the official manuscript in `draft`. `presentation` holds the markup code for seminar and conference presentations. As a PhD student also presenting posters, you might have an additional `poster` folder.

`quant` and `markup` are separate repositories because your quantitative analysis code and the work on your manuscript are often not in sync. Joining these two streams of work can lead to messy commit histories and chaotic branches.

# Virtual Environments
Data science software receives updates over time. R packages are not static. Developers fix bugs and change function behavior across releases. It, therefore, happens that you re-execute your code a few years after you wrote it and obtain different results. Because your replication package needs to reproduce the results shown in the paper, you then start digging through previous versions of the programming language and of the packages that you used. Unfortunately, many packages are not isolated pieces of software. Packages have dependencies. Hence, you puzzle together different package version combinations. In the end, you browse tens of thousands of lines of code and spend days and figuring out the source of a discrepancy.

Virtual environments prevent such drama. The `renv` package in R and the `venv` module in Python track package versions at the project level and allow you to use different versions across projects. You can use version 1.0 in one project and version 1.2 in another project. When you come back to a study at a later point or when someone else wants to execute your code, the software automatically obtains the correct package version from the automatically created configuration file and computes the same results as you did initially.

So, before you write any code, open the `quant` directory and follow the installation instructions and introductions for [`renv`](https://rstudio.github.io/renv/), [`venv`](https://docs.python.org/3/library/venv.html), or alternatively [`conda`](https://docs.conda.io/projects/conda/en/latest/user-guide/install/index.html).

This template contains automatically created example configuration files.

With C++, you do not need a virtual environment. Just use CMake with detailed flags and track that file with version control.

# Version Control
There are different version control tools out there. Git is the standard nowadays in both academia and industry. A Git tutorial is beyond the scope of this document. If you are not yet familiar with it, check out Monash's courses or one of the many other online resources on the topic. You are good to go with a few basic Git commands, which you can learn in a matter of minutes. If you want to leverage more advanced features, you should watch a few hours of instructional content.

Overall, Git tracks versions of your files. It circumvents messy organization where you end up with project directories containing `paper.tex`, `paper_new.tex`, `paper_new_new.tex`, `paper_final.tex`, `paper_final_new.tex`. It allows you to jump between commits, which are version checkpoints set by you, without throwing extra tex files into your folder.

Git comes with various labeling options for commits to easily identify versions. Recover the version of your poster that you presented at the conference last year. Roll back the changes which your coauthor made to your beautiful paper introduction. Access the robustness check that you deleted a year ago but now require to satisfy a referee. Have Git mark the lines of code that your coauthor changed last week.

Without Git, you often end up with a number of redundant files and commented out code that does not feed into the current state of the paper but which you might need later. When that later moment comes, you neither remember which of the blocks you need to uncomment nor which of the files produced your current figures and tables in the paper.

With Git, you only keep what generates the current state of the paper in the main branch. Your project looks small and concise. Git commands can recover old content if needed.

Git branches allow you to develop multiple versions in parallel. If your coauthor wants to rephrase the paper, he or she can created a new branch and in the end you only merge the changes into the main branch, i.e. the official version, that you both agree on.

If you want to collaborate with people based on Git, you need an online platform hosting the repository. GitHub and GitLab are popular choices that give you some extra functionality beyond Git. Pull requests are a tool to verify and discuss changes before they are merged into the official version of your analyses and manuscript. Issues help you keep track of to-does. And GitHub Actions facilitates automation, incl. automated tests.

# Refactoring
Git makes refactoring easier, but does not eliminate the need for it. In order to keep your repository clean, you regularly have to get together with your coauthors and figure out what content feeds into the current draft, which of the remaining code blocks and scripts should be removed, and which should be migrated to another branch.

Despite researchers' reluctance to reorganize and rewrite code, this task is essential for reproducible research.

# Clean Code
Clean code helps others and your later self to make sense of code. Use intelligible variable, function, and file names. Adhere to a consistent style. Indent based on scope. Split code into multiple not overly long files. Use comments.

There are many more clean coding recommendations. Write your code so that someone who is not part of the project can easily understand it.

# Replication Package
Once your paper has been conditionally accepted for publication, you commonly have to hand in a replication package.

As mentioned above, it tends to be inefficient to adhere to the journal replication package format from the start of your project. Instead, you can assemble the required documents in no time, if you stick to the recommendations of this SoDa Replicator template.

You have the information on input data in the documentation in the `data/raw` directory. Your virtual environment configuration file tells you which package versions you utilize. And your code documentation details how your analysis data set variables are defined.

Some journals' data editors are not overly technical. To avoid various rounds of replication package resubmission, you should stick to simple wording in your instructions.

Though requirements are not identical across journals, they tend to be similar. There are various guides on how to craft replication packages more broadly. Cynthia has written fantastic [slides](https://cynthiahqy.github.io/monash-quarto-aea/02a-template/) on replication packages in Quarto. And the [Data and Code Availability Standard](https://datacodestandard.org/) lists rules that a number of journals agree on.
