# ShinyChromaApp
Allows users to input a numeric vector (values separated by commas) and then analyze that vector using the chRoma package. 

# Usage 

Clone or download this repository to your local machine.

Open the R script shinyfunction.R in RStudio.

Make sure the required packages are installed

If not, load the packages needed:

```
library(shiny)
library(chRoma)

```
If you want to swap out my vector database, create or give it a vector database:

```
db <- create_collection()
vectors <- list(c(1.2, 2.3, 4.5), c(6.7, 8.2, 9.2))
metadata <- list(
  list(text = "This is a document", file = "source1"),
  list(text = "This is another document", file = "source2")
)
db <- add_collection(db, vectors, metadata)

```
Run the app by clicking the "Run App" button in RStudio

The app will open in a web browser

<img width="903" alt="image" src="https://github.com/fsteezy/ShinyChromaApp/assets/142864173/44e0a1fe-11bd-4a6a-8d7a-6936a2c9c9da">

Enter a numeric vector (values separated by commas) in the "Enter vector (comma-separated)" input field

<img width="424" alt="image" src="https://github.com/fsteezy/ShinyChromaApp/assets/142864173/adc410c0-9e44-4a7e-b0a2-d270a80a10d2">

Click the "Analyze" button to perform the analysis using the chRoma package

View the analysis results in the "Results" section. The app will display either the most similar vector from the pre-defined database or an error message if the input is invalid

<img width="898" alt="image" src="https://github.com/fsteezy/ShinyChromaApp/assets/142864173/8d037a04-0a32-430d-b99b-519a18944856">

## Acknowledgments
This package relies on the `chRoma` package for managing word vectors and performing various operations on them. I would like to extend my gratitude to the authors and contributors of the `chRoma` package for their hard work and open-source contributions. Without their efforts, this package would not have been possible. You can find more information about the `chRoma` package https://github.com/wincowgerDEV/chRoma.



