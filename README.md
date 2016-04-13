# conference_style
LaTeX style for an abstract book

This style generates and abstract book. The idea is to script (e.g. using Python) the creation of the sections, taking the information from a database (CSV file for example). The book has the structure:
  
  - Front Page
  - License
  - Table of Contents
  - Talks Schedule
  - Poster Schedule
  - Sections with the conference subjects
  - Abstracts

In the `minimal_example.tex` file is explained roughly how the sections are made. A PDF is provided with the final result.
To compile the `tex` file, we need `lualatex` and the `Lato` fonts installed in the system.

The `cls` file is not very tidy, because it is based in a previous work, but it has comments to where change every section.




The files are licensed under the Creative Commons Attribution-NonCommercial 4.0 International License.
