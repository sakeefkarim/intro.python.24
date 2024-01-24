# ------------------------------------------------------------------------------

# Portal to Python
# Sakeef M. Karim
# CC-BY-SA 4.0

# PREAMBLE ---------------------------------------------------------------------

#renv::restore()
library(palmerpenguins)
library(tidyverse)
library(reticulate)

# SETTING UP PYTHON IN R -------------------------------------------------------

# Create new Anaconda directory featuring select packages:

conda_create("r-python", python_version = "3.11.7")

# Moving forward, to use the conda environment created on line 13, run: 

# use_condaenv("NAME OF ENV GOES HERE")

# Add pandas and seaborn to your new Anaconda (conda) environment:

conda_install("r-python", c("pandas", "seaborn"))

# GENERATING PLOTS VIA SEABORN AND GGPLOT --------------------------------------

# Let's import some Python packages of interest:

sns <- import("seaborn")

plt <- import("matplotlib.pyplot")

# Let's visualize data from {palmerpenguins} using ggplot2:

palmerpenguins::penguins %>%
                ggplot(., aes(x = bill_depth_mm,
                              y = bill_length_mm,
                              colour = species)) +
                geom_point()

# Let's generate the same kind of plot via seaborn:

sns$set_theme()

sns$scatterplot(x = "bill_depth_mm",
                y = "bill_length_mm",
                hue = "species",
                data = palmerpenguins::penguins)

plt$show()

# To clear plots, run the following line:

# plt$clf()

plt$savefig("files/example_plot.png",
            dpi = 300,
            bbox_inches = "tight")
