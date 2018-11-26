An Introduction Digital (spatial data) Methods
================
Lex Comber and Robin Lovelace

<!-- README.md is generated from README.Rmd. Please edit that file -->

# 1\. Introduction

The goal of scities is to provide teaching materials for the Digital
Methods workshop as part of the Sustainable Cities Masters at the
University of Leeds.

In-line with the content, these materials were developed using new
digital methods. This file was generated using an ‘RMarkdown’ file:
`README.Rmd`. Why this file format instead of something like `README.md`
or (worse) `README.docx`? Because you can include R chunks like this:

``` r
d = Sys.Date()
msg = "Welcome to the digital methods workshop on "
print(paste0(msg, d))
#> [1] "Welcome to the digital methods workshop on 2018-11-26"
```

The date automatically changes each time we build (‘compile’) the
document. Automation is an important concept in digital methods. It’s
also practically useful. Automation saves time\!

This document is also reproducible, which is vital for democratically
accountable and transparent decision-making.

## 1.1 Getting started

This session sets up the main session in the rest of the workshop.

The aims of this session are to

1.  Make sure you can access RStudio on your computer
2.  Go through any queries or questions you have from the introductory
    materials in *Session 0*
3.  Provide you with the basic tools to get you started with R.

If have already worked through the Owen Guide
(<https://cran.r-project.org/doc/contrib/Owen-TheRGuide.pdf> up to page
38) in advance of this training, then this session should be a useful
refresher. If this is the first time that you have used R / RStudio then
naughty, naughty for not doing your homework, but you should be able to
get up to speed.

This session will cover a number of specific but key activities:

  - R packages
  - saving workspaces and projects
  - using scripts
  - loading data
  - simple visual data exploration (basic boxplots, histograms)
  - summary statistics

## 1.2 Why use R

R was initially developed by Robert Gentleman and Ross Ihaka of the
Department of Statistics at the University of Auckland. R is
increasingly becoming the default software package in many areas of
science. There are a number of reasons for this:

  - R includes a very large number of tools, functions and packages
      - packages are libraries of tools
      - packages are written by scientists in different subject areas
  - R has the latest methods and tools
  - New tools are in R 10-20 years ***before*** commercial software
      - e.g. GWR was around for 10 years before being in ArcGIS
  - The tools in R are open (i.e. the source code is visible)
      - you can see exactly what is being done
      - most commercial tools are hidden - *black boxes*
  - R is free\!

For these reasons R is becoming widely used in many areas of scientific
activity and quantitative research.

## 1.3 RStudio

RStudio is an IDE for R. Basically this means it makes using R easier,
with various windows and clever code-autocompletion that makes writing R
code quicker. An introdcton to geting started in R/RStdio can be found
at <https://rpubs.com/chrisbrunsdon/UQ_rbasics> - this will explain how
to install R / RStudio and critically specific packages with specific
functionality (eg for reading spatial data, making maps etc).

R and RStudio can be downloaded from the CRAN website and installed your
own computer: - R for PCs:
<https://cran.r-project.org/bin/windows/base/> - R for Macs:
<https://cran.r-project.org/bin/macosx/> - RStudio:
<https://www.rstudio.com/products/rstudio/download/#download> You should
install R before you install RStudio. RStudio is user friendly interface
to R. All of the code you write (and in this workshop) will run in both
environments. Here it assumed that you are using RStudio.

## 1.4 Working in R / RStudio

There are 2 key points about working in R

1.  When working in R, either writing your own code or copy and pasting
    from these materials, you *should* write the code into a script or
    document. Go to **File \> New File \> R Script** to open a new R
    file.

The reasons for this are so that you get used to using the R console and
running the code will help your understanding of the code’s
functionality. Then in order to run the code in the R console,a quick
way to enter it is to highlight the code (with the mouse or using the
keyboard controls) and the press `ctrl-R` or `cmd-Enter` on a Mac.

You are not expected to type all the code in - you should be able to
copy and paste from the worksheet: this is not a typing course\!

2.  Learning is R is learning to drive. You may pass your test but ti
    become a good driver it is time behind the wheel that counts. The
    importance of *learning by doing* and getting your hands dirty
    cannot be overstated. Some of the code might look a bit fearsome
    when first viewed, especially in later session BUT the only really
    effective way to understand it is to give it a try.

A further minor point is that in the code comments are prefixed by \(#\)
and are ignored by R when entered into the console. You should remember
to write your code and add annotations or comments using the `#` symbol
- you will see these in the code snippets below. These will help you
understand your code and what you did when come back to it later.

After you have installed R and RStudio, you are ready to go. You should
see something like this:

![RStudio in action](figures/rstudio-scities.png)

If you have worded your way through the Owen Guide
(<https://cran.r-project.org/doc/contrib/Owen-TheRGuide.pdf> up to page
38) then you will have come across a few things that will be re-capped
here:

1.  Assignment: this is the basic process of giving R objects values

<!-- end list -->

``` r
vals = c(4.3,7.1,6.3,5.2,3.2,2.1)
```

2.  Operations: having assigned values to object that can be manipulated

<!-- end list -->

``` r
vals*2
#> [1]  8.6 14.2 12.6 10.4  6.4  4.2
sum(vals)
#> [1] 28.2
mean(vals)
#> [1] 4.7
```

3.  Indexing: individual elements of R objects with multiple data
    elements can be referred to:

<!-- end list -->

``` r
vals[1]    # first element
#> [1] 4.3
vals[1:3]   # a subset of elements 1 to 3
#> [1] 4.3 7.1 6.3
sqrt(vals[1:3]) #square roots of the subset
#> [1] 2.073644 2.664583 2.509980
vals[c(5,3,2)]  # a subset of elements 5,3,2 - note the ordering
#> [1] 3.2 6.3 7.1
```

4.  There are many different data types in R: character, logical,
    integer etc - too many to cover here.

5.  There are many different data classes in R: Vectors, Matrices,
    Factors, Lists

## 1.5 R packages

When you install R / RStudio it comes with a large number of tools
already (referred to as *base functionality*).

However, one of the joys of R, is the community of users. Users share
what they do and create in R in a number of ways. One of these is
through packages. Packages are collections of related functions that
have been created, tested and supported with help files. These are
bundled into a package and shared with other R users via the that users
can download from the CRAN repository.

There are 1000s of packages in R. These contain set of tools and can be
written by anyone. The number of packages is continually growing. When
packages are installed these can be called as libraries. The background
to R, along with documentation and information about packages as well as
the contributors, can be found at the R Project website
<http://www.r-project.org>.

Packages can be found at the CRAN website -
<https://cran.r-project.org/web/packages/>:

<img src="figures/cran_packages.png" width="100%" />

Users install the package once to mount it on their computer, and then
it can be called in R scripts as required.

The basic operations are

1.  install the package before the first time it is used
      - you may have to set a mirror site the fist time you install a a
        package
      - **this is only done once**
2.  load the package using the `library` function to use the package
    tools
      - **this is done for each R session**

So a typical way to do this is to eneter something similar to the below

``` r
install.packages("<package name>", dep = TRUE)
```

Or you can either use the RStudio menu  

**Tools \> Install Packages…**

To install the `tidyverse` enter:

``` r
install.packages("tidyverse", dep = TRUE)
```

Note you may have to respond to the request from R / RStudio to set a
mirror - a site from which to download the package - pick the nearest
one\!

This loads a number of packages in - the tidyverse is a wrapper for many
packages and functions - hence the need for `dep = TRUE` parameter in
the `install.packages()` function above. The `tidyverse` - see
<https://www.tidyverse.org> - is a collection of R packages designed for
data science. We all live in the tidyverse now….\!

As well as `tidyverse`,i n this workshop we will use a number of
packages that you will need to install as we go through the sessions.
You should install the following packages and load them in the same way,
for example by running the following code chunk:

``` r
pkgs = c(
  "sf",        # a package for working with spatial data
  "tmap",      # a mapping package
  "osmdata",   # for working with open street map data
  "stplanr",   # a transport data package
  "tidyverse", # metapackage for data science
  "reshape2",  # for reformating/'shaping' data
  "rgeos"      # an R interface to geos, similar to sf
)
```

``` r
# install.packages(pkgs)
```

Once installed, the packages do not need to installed again for
subsequent use. The can simply be called using the `library` function.
Load packages at the start of your R session or scripts with the
`library()` function as follows:

``` r
library(sf)
library(tmap)
library(rgeos)
library(raster)
library(reshape2)
library(tidyverse)
```

You can also install packages from GitHub to get the most up-to-date
versions or packages not on CRAN (be warned: GitHub packages may not be
high quality and can be a pain to install/use\!). The following command,
for example, installs a package that gives you quick access to some
administrative zone datasets in the UK:

``` r
devtools::install_github("robinlovelace/ukboundaries")
```

## 1.6 Spatial data

Cities are spatial entities so you should know some GIS concepts before
grappling with city data. The introductory comments of Chapter 2 in the
open source and open access book [Geocomputation with
R](https://geocompr.robinlovelace.net/spatial-class.html) provide an
overview of spatial data models.

In brief, real-world discrete geographic features are represented in
spatial databases using vectors of points, lines and areas. For example,
point to represent a shop, address or postcode location, lines for
linear features such roads and areas for things likes parks, zones,
building outlines etc. Continuous features (eg temperature surfaces) are
frequently repsented by gridded or raster data. The *spatial* objects
provide a framework for hanging information or *attributes* about these
features. This could be the number of people living in each house, the
area of a park, the opening times of a shop etc, and each object can
have multiple attributes that are usually held in some form data table.
Thus a spatial database holds information about the location and extent
of geographic features and their properties or *attributes*.

There are 1000s of R packages and the `sf` (Simple Features) package
provides formats for spatial dat aand their analysis. The `sf` vignette
provides an introduction to vector data and formal descriptions of
spatial formats:
<https://cran.r-project.org/web/packages/sf/vignettes/sf1.html>

# 2\. Data sources and data import

You will be provided with all the materials you need to do this
practical work. Then later, in your own time, if you are interested in
developing these skills further…..there are a number of further reources
that you may find useful:

  - To get started with spatial data in R have a look at the practical
    at <https://rpubs.com/lexcomber/session4>.
  - For more in-depth information, you can read sections
    [2.2.5](https://geocompr.robinlovelace.net/spatial-class.html#geometry)
    and (for ‘raster’ data)
    [2.3](https://geocompr.robinlovelace.net/spatial-class.html#raster-data)
    of the same resource.
  - There is an excellent introductory text on spatial analysis and
    mapping in R:
    <https://uk.sagepub.com/en-gb/eur/an-introduction-to-r-for-spatial-analysis-and-mapping/book258267>
    2nd edition coming in December 2018\!
  - More advanced methods for manipulating spatial data can be found in
    Bivand et al (2008) see
    <http://gis.humboldt.edu/OLM/r/Spatial%20Analysis%20With%20R.pdf>
    (this assumes you know what you want to do)

We encourage you to search-for other resources on spatial data: there’s
lots out there and, like everything in digital methods, is rapidly
evolving\!

**Key point**: spatial data describe the location and outline where
appropriate of real-world geographic features. The *attribites* of
individual features are held in some form of data table (similar to a
spreadsheet).

## 2.1 Traditional data (population census etc)

Traditional city/transport planning uses official datasets. There are
many sources of spatial data and it is impossibel to list all of them.
Much geographic or spatial data about cities is provided by the
population census, conducted every 10 years. This summarises individual
household census returns to geographic areas - you may have heard of
Wards, but data can be obtained for a number of different geographies
from Output Area (small, about 300 people) to countries (large) via,
Lower Super Output Areas (~1500 people), Medium Super Output Areas
(~7500 people), local authorities, countes and unitary authorities and
regions.

In the UK, census data for these areas can be easily obtained from 2
sources.

1)  Nomisweb for census data attributes (data tables) -
    <https://www.nomisweb.co.uk>
2)  UKBorders for census data zones (areas) -
    <https://borders.ukdataservice.ac.uk/bds.html>

After downloading the data tables need to be linked to the zones and
this is done through a common key usually the census area codes, which
are unique for each area.

**Key point**: data for different geographic *zones* in the UK and their
properties can be easiliy downloaded from open respitories and then
linked together.

An example of this is official zoning systems, such as the ‘LSOA’ zones
loaded and plotted below:

``` r
zones_leeds = ukboundaries::lsoa2011_lds
plot(zones_leeds)
```

![](README_files/figure-gfm/unnamed-chunk-13-1.png)<!-- -->

## 2.2 Getting data into R

There are a number of ways of loading data into you R session:

1.  read a local file in proprietary format (eg an excel file or `.csv`
    file)
2.  read a local R formatted binary file (typically with an `.rda` or
    `.RData` extension)
3.  download and manipulate data from the internet - we are not going to
    do that in this workshop)
4.  read a file from somewhere in the internet (proprietary or R binary
    format) - we may do some of that.

Unofficial datasets, such as those provided by the OpenStreetMap project
are messier but in some cases richer. An exmaple is provided below,
which downloads and plots parks in Leeds (you can also download the data
from `parks.Rds`):

``` r
library(osmdata)
q = opq(bbox = 'leeds, uk') %>% 
  add_osm_feature(key = "leisure", value = "park")
```

``` r
res_parks = osmdata_sf(q = q)
parks = res_parks$osm_polygons
plot(parks$geometry)
```

![](README_files/figure-gfm/unnamed-chunk-15-1.png)<!-- -->

## 2.3 Loading data for this session

Before you load data ensure you are in a new project. You can do this in
2 ways:

1.  Go to File \> New Project in RStudio. Choose a suitable name.
2.  Navigate to
    [github.com/ITSLeeds/scities](https://github.com/ITSLeeds/scities)
    and click ‘Clone or download’. Download and unzip the .Zip file.
    Open the file `scities.Rproj` in the zipped file. The result is
    shown below (see the ‘scities’ project name in the top right-hand
    corner in Figure 1 above).

To download **data** used in this session go to
[github.com/ITSLeeds/scities](https://github.com/ITSLeeds/scities),
click on ‘[Releases](https://github.com/ITSLeeds/scities/releases)’ and
and click on
[**data\_sci.zip**](https://github.com/ITSLeeds/scities/releases/download/0.1/data_sci.zip).

Unzip the contents of the folder into the same working directory where
you created a project. You should see the data, including
`.z_attributes.csv` in the Files panel of RStudio as shown below. You
should now be in an R session with access to all the data needed for
this tutorial.

**Note: RStudio projects are important because they set the working
directory.**

## 2.4 Loading `.csv` format data

The base installation of R comes with core functions for reading `.txt`,
`csv` and other tabular
formats.

<!-- To load data from local files you need to point R / RStudio to the directory that contains the local file. One way is to use the `setwd()` function as in the below -->

<!-- ```{r, eval=FALSE} -->

<!-- ## Mac -->

<!-- wd_old = setwd("scities/") -->

<!-- ``` -->

<!-- ```{r, eval=FALSE} -->

<!-- ## Windows -->

<!-- setwd("C:\\users\\...\\data_sci") -->

<!-- ``` -->

<!-- Another is to use the menu system -->

<!-- **Session > Set Working Directory ...** which give you options to chose from. -->

<!-- However you do it you should now set your working directory to the folder that contains the file `msoa_data_in.csv` and run the code below to load the data: -->

``` r
# load the data
zones = read_csv("z_attributes.csv")
```

This loads a data table of 107 rows and 109 columns. These are data for
the 107 MSOAs census areas in Leeds. These are *Medium Super Output
Areas* containing around ~7,500 people in each. Here the data was
obtained from <https://www.nomisweb.co.uk/census/2011/WU03EW> and
describes proportions of people travelling to work by bike ***from***
each MSOA ***to*** each MSOA. Data with from-to information are known as
“origin-destination” data or “flow” data.

. You can inspect the data in a few ways.

``` r
## dimensions - rows and columns
dim(zones)
#> [1] 299  65
## column / variable names
head(names(zones))
#> [1] "geo_code" "geo_name" "lad11cd"  "lad_name" "all"      "bicycle"
## look at the first 2 rows and 3 columns
zones[1:3, 1:2]
#> # A tibble: 3 x 2
#>   geo_code  geo_name    
#>   <chr>     <chr>       
#> 1 E02002183 Bradford 001
#> 2 E02002184 Bradford 002
#> 3 E02002185 Bradford 003
## use the sumamry function for the second column
summary(zones[2])
#>    geo_name        
#>  Length:299        
#>  Class :character  
#>  Mode  :character
```

The default for `read.csv` is that the file has a header (i.e. the first
row contains the names of the columns) and that the separator between
values in any record is a comma. However these can be changed depending
on the nature of the file you are seeking to load into R. A number of
different types of files can be read into R.You should examine the help
files for reading data in different formats. Enter `??read` to see some
of these listed. You will note that `read.table` and `write.table`
require more parameters to be specified than `read.csv` and `write.csv`.

## 2.5 Loading spatial data including Shapefiles and Rasters

The code below loads an ESRI format spatial data shapefile using the
`st_read` function in the `sf` package, which you should have installed
and loaded earlier. The `st_read` function can be used to load some
spatial data:

``` r
# load Spatial data  
zones_sf = read_sf("zones_sf.geojson")  
```

This data was obtained from the UK Census Data service. It simply
contains outlines of the MSOA areas. The data attributes can be examined
using the `as_tibble` function from the `tidyverse`:

``` r
head(as_tibble(zones_sf), 2)
#> Simple feature collection with 2 features and 2 fields
#> geometry type:  POLYGON
#> dimension:      XY
#> bbox:           xmin: -1.930863 ymin: 53.89958 xmax: -1.777837 ymax: 53.96139
#> epsg (SRID):    4326
#> proj4string:    +proj=longlat +datum=WGS84 +no_defs
#> # A tibble: 2 x 3
#>   geo_code  population                                            geometry
#>   <chr>          <int>                                       <POLYGON [°]>
#> 1 E02002183       2193 ((-1.878136 53.9601, -1.878882 53.95427, -1.874151…
#> 2 E02002184       4987 ((-1.847689 53.94077, -1.812772 53.93863, -1.81253…
```

You can also examine the spatial properties of the data using the `plot`
function associated with `sf` objects. This can be used to plot the
outline of the data objects.

``` r
# outline
plot(st_geometry(zones_sf))
```

![](README_files/figure-gfm/unnamed-chunk-20-1.png)<!-- -->

## 2.6 Loading R binary files

You can also load R binary files. These have the advantage of being very
efficient at storing data and quicker to load than for example, `.csv`
files. By convention they have a `.rds` extension:

``` r
saveRDS(zones, "zones.Rds")
zones = readRDS("zones.Rds")
## use ls to see what is loaded
ls()
```

You should see that a variable called `bike_travel` has been loaded. It
is the same as the data read into `zones`. You can explore the
`bike_travel` R object if you want to using the functions above that
were applied to `zones`.

## 2.7 Other data formats

If you continue to work with R you will want to use all kinds of
different data formats - from different flavours of data table `.CSV`,
`Excel`, `SPSS` to explicitly geographical data such as shapefiles and
rasters. These can all be loaded directly into R using functions from
different packages. There are too many to cover comprehensively. But
generally if there is a data format out there, there is also a tool to
get it into R\!

The `foreign` package can be used to load many file types (e.g. EXCEL
and SPSS) and a number of different approaches for reading data types
are listed here: <https://www.r-bloggers.com/read-excel-files-from-r/>

# 3\. Data export

## 3.1 CSV Files

Data can be written into a Comma Separated Variable file using the
command `write.csv` and then read back into a different variable, as
follows:

``` r
write_csv(zones, file = "zones.csv")
```

This writes a `.csv` file into the current working
directory.

<!-- If you open it using a text editor or a spreadsheet software, you will see  that it has the expected column plus the index for each record. This is because the default for `write.csv` includes the `row.names = TRUE` parameter. Again examine the help file for this function. -->

<!-- ```{r eval = F} -->

<!-- write.csv(ttw, file = "test.csv", row.names = F) -->

<!-- ``` -->

## 3.2 Spatial data including geojson

Read spatial data with `read_sf()` (make sure you have downloaded the
data from
[github.com/ITSLeeds/scities/releases](https://github.com/ITSLeeds/scities/releases)):

``` r
zones_sf = read_sf("z.geojson")
```

In a similar way the `st_write` function can used to write data out into
a number of formats

``` r
st_write(zones_sf, "msoa.shp" )
```

## 3.3 R Data files

It is possible to save variables that are in your workspace to a
designated `.rda` or `.RData` file. This can be loaded at the start of
your next session. Saving your *workspace* saves everything that is
present in your workspace - as listed by `ls()` - whilst the `save`
command allows you to specify what variables you wish to save.

There are a number of ways to do this:

You can save the workspace using the drop down menus **Session \> Save
Workspace As…**

You can save the workspace using the `save.image` function

``` r
save.image(file = "myworkspace.RData")
```

You can save specified elements using the `save` function recalling that
either `.rda` or `.RData` extensions can be used:

``` r
# this will save everything in the workspace
save(list = ls(), file = "MyData.rda")
# this will save just zones
save(list = "zones", file = "MyData.RData")
# this will save zones and zones_sf
save(list = c("zones", "zones_sf"), file = "AllData.rda")
```

Make sure you run the last line of code as you will use the results in
the next section.

# 4\. Initial Exploratory Data Analysis

The aim of Exploratory Data Analysis (EDA) is to examine the data.
Specifically you might might be interested in distributions, mean,
median, max and min values, tables of class counts and, if undertaking
some kind of statistical analysis such as regression, examining the
correlations between the covariates and the target variable, determining
the presence of any collinearity. The aim here is understanding - what
do the data show, what are the spatial and non-spatial properties, what
variables might you include or exclude from your analysis (variable
selection).

In the below these considerations are evaluated in the following
sequence:

1.  simple descriptive statistics
2.  Distributions and skewness (you may need to undertake
    transformations of certain variables) and the presence of outliers.
3.  Correlations (but these are not covered in this workshop)

In the previous sections you loaded and saved a number of R objects. To
make sure you have the right data you should clear your workspace and
re-load the `AllData.rda` file. To clear our workspace either go to
**Session \> Clear Workspace…**\* or enter

``` r
rm(list = ls())
```

Load the travel to work data by cycling again for the MSOAs in Leeds and
check what is loaded us `ls()`:

``` r
load("AllData.rda")
ls()
#> [1] "zones"    "zones_sf"
```

## 4.1 Simple data explorations

You have two R objects in your workspace: `zones` and `zones_sf`. The
first thing is establish what types or classes they are:

    class(zones)
    class(zones_sf)

Here we can see that both objects are of the class `data.frame`. This is
a data table a but like a spreadsheet in Excel. The `zones_sf` object is
also of class `sf` indicating its spatial nature.

First, examine the `zones` data. This records the proportions of working
people (commuters) cycling to work in each MSOA area to each other MSOA
area in Leeds (the data is *WU03EW - Location of usual residence and
place of work by method of travel to work (MSOA level* and has been
downloaded from here: <https://www.nomisweb.co.uk/census/2011/WU03EW>
and manipulated a bit for use in this workshop). The MSOA codes in the
`zones` data contains the **origin** (rows) and **desination** (columns)
MSOAs. The `dim`, `head` and `names` functions show that the data has
107 rows, 109 columns, the names are a series of census codes:

``` r
dim(zones)
#> [1] 299  65
```

There are 107 of these areas in
Leeds

<!-- Notice how the code above just examined the first 10 columns of the `zones` data and notice how low the data values are. This is confirmed when the `summary` function is used:  -->

<!-- ```{r, eval=FALSE, echo=FALSE} -->

<!-- # commented-out -->

<!-- summary(zones[, 3:]) -->

<!-- # examine the Pop variable -->

<!-- summary(zones$Pop) -->

<!-- ``` -->

We can see the total proportions of the commuting population that is
cycling to work living in each LSOA using the code below.

``` r
head(zones$bicycle / zones$all) 
#> [1] 0.006839945 0.013434931 0.010146561 0.008761584 0.013043478 0.010162602
```

The numbers are low - typically around 0.02. We could make the numbers a
bit easier to interpret by normalising these proportions so that they
describe the numbers of commuters by bike per 1000
commuters

``` r
zones$percent = zones$bicycle / zones$all * 100
```

<!-- And then when we look at the numbers cycling from each LSOA origin again  -->

<!-- ```{r} -->

<!-- round(apply(zones[, 3:109], 1, sum), 2) -->

<!-- ``` -->

<!-- There are obviously some areas that which have more cycling commuters (let's call them *CCs*) than others.   -->

<!-- **** -->

<!-- **NB** the line of code above although complex, can be unpicked:  -->

<!-- - `apply` is a function that applies another function to a data table either over each row in the data table or each column. The direction the function is applied is indicated by the second argument in the call to the function, in this case `1` for each row (`2` would indicate each column) -->

<!-- - the function is `sum` which sums all the values in each row  -->

<!-- - the data table, `zones[, 3:109]` is all rows and columns 3 to 109 -->

<!-- - `round` is another function that allows you to control the number of decimal places, in this case 2 (although none were shown: try running `apply(zones[, 3:109], 1, sum` to see what happens when you don't use it) -->

<!-- So just by change the `1` to `2` the same code can be used to see how many people travel *to* each MSOA ie each destination (The `as.vector` gets rid of the names in the result):  -->

<!-- ```{r} -->

<!-- as.vector(round(apply(zones[, 3:109], 2, sum), 2)) -->

<!-- ``` -->

<!-- There are some MSOAs that have very high numbers of people cycling to them. Why do you think this is?  -->

<!-- **** -->

## 4.2 Visual data expolorations

The `hist` function can be used visually sumamrise distributions of
values across the MSOAS. Try running the code below;

``` r
hist(zones$all, breaks = 10,
  xlab = "Population", main = "Populations across MSOAs in Leeds", col = "red")
```

![](README_files/figure-gfm/unnamed-chunk-33-1.png)<!-- -->

Alternatively`ggplot2` package that is loaded with the `tidyverse` van
also be used:

``` r
ggplot(zones, aes(x = all)) + 
    geom_histogram(binwidth=180,colour="white", fill = "red") +
    xlab("Population")+
    labs(title="Populations across MSOAs in Leeds")
```

![](README_files/figure-gfm/unnamed-chunk-34-1.png)<!-- -->

This is more involved than simple `hist` but the basic idea is that
`ggplot` is called and then the type of plot is specified. It allows
layers of plot instructions to be compiled. It can also be used to
create density plots:

``` r
ggplot(zones, aes(x= all)) + 
    geom_histogram(aes(y=..density..),
                   binwidth=180,colour="white") +
    geom_density(alpha=.2, fill="#FF6666") +
    theme(axis.title.y=element_blank())+
    xlab("Population")+
    labs(title="Populations across MSOAs in Leeds")
```

![](README_files/figure-gfm/unnamed-chunk-35-1.png)<!-- -->

The `boxplot()` function also provides a useful way of summarising data:

``` r
boxplot(zones$all, main = "The distribution MSOA populations in Leeds")
```

![](README_files/figure-gfm/unnamed-chunk-36-1.png)<!-- -->

And there is `ggplot` version as well but this is not so good for single
values and better when comparing distributions of some value across
categorical variables (as is done later in this section)

``` r
ggplot(zones, aes(x=1, y = all)) + 
    geom_boxplot() 
```

![](README_files/figure-gfm/unnamed-chunk-37-1.png)<!-- -->

We can also examine the `zones_sf` object in the same way. The
`as_tibble` function converts the `data.frame` of `zones_sf` to a
`tibble format. We do not have time to cover this here but these are
another data table similar to`data.frame\` but a bit smarter

``` r
summary(as_tibble(zones_sf[1:3]))
#>    geo_code           geo_name           lad11cd         
#>  Length:299         Length:299         Length:299        
#>  Class :character   Class :character   Class :character  
#>  Mode  :character   Mode  :character   Mode  :character  
#>           geometry  
#>  POLYGON      :299  
#>  epsg:4326    :  0  
#>  +proj=long...:  0
```

This shows that we have some categorical variables (actual a Rural and
Urban classification) and some codes relating to MSOA labeling.

As this is spatial data some of these attributes can be mapped: Or the
attributes held by each object in the spatial dataset (in this case 107
MSOA census areas in Leeds:

``` r
# plot by attrubute
plot(zones_sf["foot"])
```

![](README_files/figure-gfm/unnamed-chunk-39-1.png)<!-- -->

The `tmap` package allows more sophisticated maps (as `ggplot2` does for
other graphics):

``` r
tm_shape(zones_sf) +
  tm_polygons("foot")
```

![](README_files/figure-gfm/unnamed-chunk-40-1.png)<!-- -->

However, `tmap` also allows interactive graphics for example with an
OpenStreetMap backdrop, Notice the use of transparency parameter
specified through `aslpha` and a particular OSM backdrop in the code
below:

``` r
# set the mode to view for OSM
tmap_mode('view')
# call the basic map but with 
tm_shape(zones_sf) +
  tm_polygons("foot", alph = 0.4) +
  tm_view(basemaps = "OpenStreetMap")
```

![](README_files/figure-gfm/unnamed-chunk-41-1.png)<!-- -->

``` r
# reset the plot mode
tmap_mode('plot')
```

You should be able to zoom in and explore *where* these different
classes of urban and ruralness are.

## 4.3 Combining / Joining data

You may have noticed that `zones` and `zones_sf` have an attribute in
common:

``` r
head(zones$geo_code)
#> [1] "E02002183" "E02002184" "E02002185" "E02002186" "E02002187" "E02002188"
head(zones_sf$geo_code)
#> [1] "E02002183" "E02002184" "E02002185" "E02002186" "E02002187" "E02002188"
```

These can be used to link or join the data together.

``` r
zones_joined = left_join(zones_sf, zones)
class(zones_joined)
#> [1] "sf"         "tbl_df"     "tbl"        "data.frame"
names(zones_joined)[1:9]
#> [1] "geo_code"      "geo_name"      "lad11cd"       "lad_name"     
#> [5] "all"           "bicycle"       "foot"          "car_driver"   
#> [9] "car_passenger"
head(as_tibble(zones_joined[, 1:6]))
#> Simple feature collection with 6 features and 6 fields
#> geometry type:  POLYGON
#> dimension:      XY
#> bbox:           xmin: -1.980917 ymin: 53.86202 xmax: -1.717293 ymax: 53.96139
#> epsg (SRID):    4326
#> proj4string:    +proj=longlat +datum=WGS84 +no_defs
#> # A tibble: 6 x 7
#>   geo_code geo_name lad11cd lad_name   all bicycle
#>   <chr>    <chr>    <chr>   <chr>    <dbl>   <dbl>
#> 1 E020021… Bradfor… E08000… Bradford  2193      15
#> 2 E020021… Bradfor… E08000… Bradford  4987      67
#> 3 E020021… Bradfor… E08000… Bradford  2661      27
#> 4 E020021… Bradfor… E08000… Bradford  5935      52
#> 5 E020021… Bradfor… E08000… Bradford  2530      33
#> 6 E020021… Bradfor… E08000… Bradford  3444      35
#> # ... with 1 more variable: geometry <POLYGON [°]>
```

Notice how the attributes from `zones` have been joined to those of
`msoa` in `zones_joined` which is also a `sf` object. It can be mapped
as before, again with a transparency term:

``` r
tmap_mode('view')
tm_shape(zones_joined) +
  tm_polygons("all", alph = 0.4) +
  tm_view(basemaps = "OpenStreetMap")
```

![](README_files/figure-gfm/unnamed-chunk-44-1.png)<!-- -->

``` r
# reset the plot mode
tmap_mode('plot')
```

And a boxplot of the population distributions for different types of
MSOA can be shown together:

``` r
# Boxplot
ggplot(zones_joined, aes(lad_name, all)) +
  geom_boxplot()+
  xlab("Rural / Urban Class")+
  ylab("Population")+
  labs(title="Population distributions across different Rural / Urban MSOAs in Leeds")
```

![](README_files/figure-gfm/unnamed-chunk-45-1.png)<!-- -->

Further resources on **ggplot2** can be found here:

  - ggplot guide:
    <http://www.sthda.com/english/wiki/be-awesome-in-ggplot2-a-practical-guide-to-be-highly-effective-r-software-and-data-visualization>
  - ggplot cheat sheet:
    <https://www.rstudio.com/wp-content/uploads/2015/03/ggplot2-cheatsheet.pdf>

# 5\. Summary of work so far

This session has provided some rubrics for working in R (scripts, etc)
showed how to get data in and out of R and developed some simple
visualisations of data.

In later sessions we will expand n this but using the `ggplot2` package.
This comes with the `tidyverse` and although it involves a bit of a
learning curve it produces excellent visualisations and is extremely
controllable. However there is at first but there is plenty of help and
advice on the internet and in core text books. For example the following
sites may be useful:

You should be set up for the rest of the workshop and

  - have R and RStudio installed
  - be able to create and save scripts for your code
  - annotate the code with comments using the `#` symbol
  - set and change your working directory (either through the menu or
    use `setwd()`)
  - be able to load csv spatial and R data files from local folders

If **any** of the above are not true then please talk to Lex or Robin
now\!\!\!

Next we will develop some analysis of flows.

# 6\. Flows

## 6.1 Origins and Destinations

In the second part of the practical we will look at commuting flows
between MSOAs by bike and identify opportunities for extending the cycle
network in Leeds .

We will load the origin-destination data from `od_attributes.csv`:

``` r
od_attributes = read_csv("od_attributes.csv")
```

``` r
tm_shape(zones_joined) +
  tm_polygons(c("bicycle", "car_driver")) +
  tm_layout(legend.position = c("left","bottom"))
```

![](README_files/figure-gfm/unnamed-chunk-47-1.png)<!-- -->

Here we can see that there are very distinct and perhaps expected
patterns with flows into the centre of Leeds from the surrounding areas.

## 6.2 Mapping Flows

In terms of mapping flows, an origin-destination matrix can be converted
into ‘long’ format using code adapted from
<http://spatial.ly/2015/03/mapping-flows/>.

<!-- The code *melts* the `ttw` data to 3 columns, links that to MSOA polygon geometric centroids (these are points that represent the centre of  each MSOA area) and then merges these together  -->

<!-- ```{r} -->

<!-- # melt the data -->

<!-- input = melt(zones[,-c(2, 110, 111)], id.vars = "From_MSOA") -->

<!-- names(input)= c("origin", "destination","total") -->

<!-- # create centroids with a Code reference -->

<!-- centroids = data.frame(st_coordinates(st_centroid(msoa)), Code = msoa$code) -->

<!-- # merge to get the xy coordinates joined to the origins -->

<!-- or.xy= merge(input, centroids, by.x="origin", by.y="Code") -->

<!-- names(or.xy)= c("origin", "destination", "trips", "oX", "oY") -->

<!-- # merge to get the xy coordinates joined to the destinations -->

<!-- dest.xy=  merge(or.xy, centroids, by.x="destination", by.y="Code") -->

<!-- names(dest.xy)= c("origin", "destination", "trips", "oX", "oY", "dX", "dY") -->

<!-- ``` -->

<!-- This having been done the flows greater than 3, can be plotted using `ggplot`. First some parameters need to be set: -->

<!-- ```{r} -->

<!-- xquiet= scale_x_continuous("", breaks=NULL) -->

<!-- yquiet<-scale_y_continuous("", breaks=NULL) -->

<!-- quiet<-list(xquiet, yquiet) -->

<!-- ``` -->

<!-- Then apply `ggplot` with `geom_segment`: -->

<!-- ```{r} -->

<!-- # plot line segments with ggplot  -->

<!-- ggplot(dest.xy[which(dest.xy$trips>3),])+ -->

<!--   # "alpha=" is line transparency below  -->

<!--   geom_segment(aes(x=oX, y=oY,xend=dX, yend=dY, alpha=trips), size = 1, col="white")+ -->

<!--   # then set the line transparency - essential to make the plot readable -->

<!--   scale_alpha_continuous(range = c(0.03, 0.3))+ -->

<!--   # set background, and remove axes and fix aspect ratio -->

<!--   theme(panel.background = element_rect(fill='black',colour='black'))+ -->

<!--   quiet+ -->

<!--   coord_equal() -->

<!-- ``` -->

<!-- Some context can be applied by modifying the plot commands above: -->

<!-- ```{r cache1, cache = T, message=F, warning=F, cache = F, results='hide'} -->

<!-- # prepare an outline of the study area  -->

<!-- pols = SpatialPolygonsDataFrame(gUnaryUnion(as(msoa, "Spatial")), data = data.frame(1)) -->

<!-- pols@data$id = rownames(pols@data) -->

<!-- pols.points = fortify(pols, region="id") -->

<!-- pols.df = left_join(pols.points, pols@data, by="id") -->

<!-- # then apply a modified version of the above plotting  -->

<!-- ggplot()+ -->

<!-- # "alpha=" is line transparency below  -->

<!-- geom_polygon(data = pols.df, aes(x=long, y=lat), colour="grey", fill="tomato") + -->

<!-- geom_segment(data = dest.xy[which(dest.xy$trips>10),],  -->

<!--   aes(x=oX, y=oY,xend=dX, yend=dY, alpha=trips), size = 1, col="black")+ -->

<!-- # then set the line transparency - essential to make the plot readable -->

<!--   scale_alpha_continuous(range = c(0.03, 0.3))+ coord_equal() -->

<!-- ``` -->

In this case we will use the pre-existing origin-destination datset
`od_attributes`.

The origin-destination data in `input` can be converted into a spatial
(`sf`) object with the function `stplanr::od2line(flow = od_attributes,
zones_sf)`.

Instead, we’ll use a pre-saved object called `desire_lines`, loaded and
plotted as follows:

``` r
desire_lines = readRDS("l.Rds")
plot(desire_lines[1:2])
```

![](README_files/figure-gfm/unnamed-chunk-48-1.png)<!-- -->

This may look like a [Jackson
Pollok](https://en.wikipedia.org/wiki/Jackson_Pollock) piece of art but
actually the result is useful: `desire_lines` is a fully fledged spatial
object so we can do geographic operations on it, such as finding a 500 m
buffer around each one. Instead of putting a buffer around *every* flow
we will pick the top 100 lines (that have a distance) for clarity:

``` r
desire_lines$length = st_length(desire_lines) %>% 
  as.numeric()
desire_lines_lines = desire_lines[desire_lines$length > 0, ]
desire_lines100 = top_n(desire_lines_lines, n = 100, wt = all)
desire_lines100_buffer = st_buffer(desire_lines100, dist = 0.01)
#> Warning in st_buffer.sfc(st_geometry(x), dist, nQuadSegs, endCapStyle =
#> endCapStyle, : st_buffer does not correctly buffer longitude/latitude data
plot(desire_lines100_buffer["all"])
```

![](README_files/figure-gfm/unnamed-chunk-49-1.png)<!-- -->

## 6.3 Routing to represent cycling behaviour

There are 2 main types of route assignment you can do in R: on-line
routing and off-line routing. Both are covered in the
[Transport](https://geocompr.robinlovelace.net/transport.html) chapter
of geocomputation with R. Online routing is easier so that’s what we’ll
do here. Beware: this requires and API key though, so the subsequent
code chunk is commented-out. If you get a cyclestreets API key, and save
it as `CYCLESTREETS=your-code-goes-here` in your `.Renviron` file, you
can reproduce it (if none of that made sense and you want to learn more,
look it up\!):

``` r
# note: this code chunk does not run - requires API key
desire_lines100_wgs = st_transform(desire_lines100, 4326)
odf = stplanr::line2df(desire_lines100_wgs)
origins = odf[c("fx", "fy")]
destinations = odf[c("tx", "ty")]
route1 = cyclestreets::journey(origins[1, ], destinations[1, ])
plot(route1)
routes = lapply(1:100, FUN = function(i) {
  r = cyclestreets::journey(origins[i, ], destinations[i, ])
  r$route_number = i
  r
  })
routes_df = do.call(rbind, routes)
plot(routes_df)
saveRDS(routes_df, "routes_df.Rds") # save result
piggyback::pb_upload("routes_df.Rds")
```

``` r
# note: requires routes from
# https://github.com/ITSLeeds/scities/releases
routes_df = readRDS("routes_df.Rds")
plot(routes_df[routes_df$route_number == 1, ])
```

![](README_files/figure-gfm/unnamed-chunk-51-1.png)<!-- -->

``` r
plot(routes_df)
#> Warning: plotting the first 9 out of 10 attributes; use max.plot = 10 to
#> plot all
```

![](README_files/figure-gfm/unnamed-chunk-51-2.png)<!-- -->

## 6.4 Cycle Routes between flow areas

The package **osmdata** can be used to download cycleways in Leeds,
using the same technique as used above to download the paths. We need to
find out what the `key` is first. Searching for “cycleway osm” pretty
quickly leeds to the site
[wiki.openstreetmap.org](https://wiki.openstreetmap.org/wiki/Key:cycleway),
which explains how cycleways are tagged in OSM.

``` r
osm_sf = opq("Leeds, UK") %>%
            add_osm_feature(key = "cycleway") %>%
            osmdata_sf()
saveRDS(osm_sf, "osm_sf.Rds")
```

For speed of processing this has be pre-saved and can be loaded as
follows:

``` r
osm_sf = readRDS("osm_sf.Rds")
```

We can inspect the object that we have extracted

``` r
class(osm_sf$osm_lines)
names(osm_sf$osm_lines)
osm_sf$osm_lines
```

And then plot the spatial object

``` r
plot(st_geometry(osm_sf$osm_lines))
```

![](README_files/figure-gfm/unnamed-chunk-55-1.png)<!-- -->

It would be nice to see this in the context of the MSOAs but the
`hampi_sf$osm_lines` data will need to be converted to the same spatial
reference as the MSOAs: from WGS84 (latitude and longitude) in decimal
degrees to Ordnance Survey’s British National Grid in metres:

``` r
osm_sf$osm_lines = st_transform(osm_sf$osm_lines, crs = 27700)
tm_shape(osm_sf$osm_lines)+
  tm_lines(lwd = 2, col = "red")+
  tm_shape(zones_sf)+
  tm_borders(, alpha = 0.5, col = "lightgrey")
```

![](README_files/figure-gfm/unnamed-chunk-56-1.png)<!-- -->

This shows the current cycle routes and can be considered against the
original and destinations mapped
before:

<!-- ```{r eval = F} -->

<!-- tm_shape(temp) + -->

<!--   tm_polygons(c("OriginSum", "DestSum")) + -->

<!--   tm_layout(legend.position = c("left","bottom")) -->

<!-- ``` -->

<!-- There are many ways we could / should determine new cycle routes but perhaps the easiest is to examine the distribution of distances that people cycle, to identify the typical distances that people are prepared to cycle in this region. We can use the distribution of distances people cycle to do this. First we  can write a little function and to calculate the distance between the coordinates in the `dest.xy` data created above: -->

<!-- ```{r} -->

<!-- head(dest.xy) -->

<!-- # function to calulate distace in km between MSOAs -->

<!-- calc.dist = function(x){ -->

<!--   return( sqrt( (x[3]-x[1])^2 + (x[4]-x[3])^2 ) /1000) -->

<!-- } -->

<!-- # create a new variable in dest.xy -->

<!-- dest.xy$dist = apply(dest.xy[,4:7], 1,calc.dist ) -->

<!-- ``` -->

<!-- Then we can use this to generate a distribution of distances cycled to work -->

<!-- ```{r} -->

<!-- trip.counts = round(dest.xy$trips, 0) -->

<!-- dist.vec = vector() -->

<!-- for( i in 1: length(trip.counts)) { -->

<!--   dist.i = rep(dest.xy$dist[i], trip.counts[i]) -->

<!--   dist.vec = append(dist.vec, dist.i) -->

<!-- } -->

<!-- ``` -->

<!-- The results can be checked  -->

<!-- ```{r} -->

<!-- length(dist.vec) -->

<!-- sum(zones$all) -->

<!-- ``` -->

<!-- And then we can have a look at the distribution of cycling trip distances and specifally the typical distance people cycle use the inter-quartile range (IQR): -->

<!-- ```{r} -->

<!-- summary(dist.vec) -->

<!-- ggplot(data.frame(x = dist.vec), aes(x = x)) +  -->

<!--     geom_histogram(binwidth=1,colour="white") + -->

<!--     geom_vline(aes(xintercept = summary(dist.vec)[2]), lwd = 2, col = "#FB6A4ACC") + -->

<!--     geom_vline(aes(xintercept = summary(dist.vec)[5]), lwd = 2, col = "#FB6A4ACC") + -->

<!--     xlab("Distance (km)")+ -->

<!--     labs(title="Distribution of commuting cycle distances in Leeds, with IQRs") -->

<!-- ``` -->

<!-- So most people travel between 3.8 and8.1 km during their cycling commute and we know that the majority of the commuting is to the centre of the city. This suggests a region around the centre MSOAs that could be mapped and investigated for potential routes. To confirm we can map the MOSAs with more than 150 cycle commutes.  We will need to work with projected data (in metres) to make the distance measures easier.  -->

<!-- First we need to make an index to align and reorder `ttw` to make sure the data rows are aligned. -->

<!-- ```{r} -->

<!-- index = match(msoa$code, ttw$From_MSOA) -->

<!-- index  -->

<!-- ttw = ttw[index, ] -->

<!-- ``` -->

<!-- Then we can map the MSOAs that are the largest destinations to confirm they are contiguous and then combine these and create buffers reflecting these distances. Here we have to work in projected: -->

<!-- ```{r, echo=FALSE} -->

<!-- # map  -->

<!-- tm_shape(zones_sf)+ -->

<!--   tm_borders("lightgrey")+ -->

<!--   tm_shape(zones_sf[ttw$DestSum > 150,])+ -->

<!--   tm_polygons() -->

<!-- # combine -->

<!-- city = st_union(zones_sf[ttw$DestSum > 150,]) -->

<!-- city_buf_inner <-st_buffer(city, 3800)  -->

<!-- city_buf_outer <-st_buffer(city, 8100)  -->

<!-- ``` -->

<!-- Then we can examine the commuters in the MSOAs in this area, with cycle routes in order to suggest areas for cycle route development.  -->

<!-- ```{r, echo=FALSE} -->

<!-- # set the plot to the outer buffer -->

<!-- tm_shape(city_buf_outer)+ -->

<!--   tm_borders(NULL)+ -->

<!-- # map the MSOA origins  -->

<!--   tm_shape(temp)+ -->

<!--   tm_polygons("OriginSum")+ -->

<!-- # map the core MSOAs destinations -->

<!--   tm_shape(city)+ -->

<!--   tm_polygons()+ -->

<!-- # map the buffers -->

<!--   tm_shape(city_buf_outer)+ -->

<!--   tm_borders("red")+ -->

<!--   tm_shape(city_buf_inner)+ -->

<!--   tm_borders("red")+ -->

<!-- # finally map the existingclyce routes -->

<!--   tm_shape(osm_sf$osm_lines)+ -->

<!--   tm_lines(lwd = 2, col = "red") -->

<!-- ``` -->

<!-- This suggests a number of possible area for expansion of the cycle route where there are large number of existing cycle commuters and a lack of cycle routes: -->

<!-- - to the North-North-West of the city -->

<!-- - to the North-North-East of the city -->

<!-- - to the South of the city -->

<!-- There are a number of caveats and potential refinements that could be undertaken: -->

<!-- - MSOAs are quite spatially course and lower geographies could be more informative -->

<!-- - MSOA centroids were used to evaluate distances -->

<!-- - the Census data are quite out of date and cycling has exploded in recent years meaning that the patterns of cycle commuting may have changed -->

<!-- - further analyses could examine how the development of cycle routes could be used to expand the cycling community -->

## 6.5 Finding mismatches between cycle use and cycling infrastructure

As a final step we will do a spatial operation to find out which cycling
routes have most and least cycle infrastructure. This will help
prioritise new infrastructure at the route (not just area) level. The
first stage is to aggregate the `routes_df` object by ids to get 100
routes:

``` r
routes_100 = aggregate(routes_df["busynance"],
                       by = list(routes_df$route_number), "sum")
plot(routes_100["busynance"])
```

![](README_files/figure-gfm/unnamed-chunk-57-1.png)<!-- -->

Then we can convert this into the same CRS as the zones, and buffer the
result as before:

``` r
routes_100_osgb = st_transform(routes_100, 27700)
routes_buff = st_buffer(routes_100_osgb, dist = 500)
```

The final stage for estimating the best and worst catered-for routes in
Leeds is to measure the distance of cycleway in each route buffer (note
this is an overly simple approach, think how it could be improved):

``` r
cycleways_near = st_intersection(osm_sf$osm_lines, routes_buff)
#> Warning: attribute variables are assumed to be spatially constant
#> throughout all geometries
plot(cycleways_near$geometry)
```

![](README_files/figure-gfm/unnamed-chunk-59-1.png)<!-- -->

We can total up the distances as follows:

``` r
cycleways_near$length = as.numeric(st_length(cycleways_near))
routes_length_cycleway = aggregate(cycleways_near["length"], routes_buff, sum)
```

The results look like this:

``` r
plot(routes_length_cycleway, col = sf.colors(5, alpha = 0.3))
#> Warning in plot.sf(routes_length_cycleway, col = sf.colors(5, alpha =
#> 0.3)): col is not of length 1 or nrow(x): colors will be recycled; use pal
#> to specify a color palette
```

![](README_files/figure-gfm/unnamed-chunk-61-1.png)<!-- -->

Or with our new **tmap** skill like this (this is easier to interpret):

``` r
tm_shape(routes_length_cycleway) +
  tm_fill(col = "length", alpha = 0.2, palette = "inferno")
```

![](README_files/figure-gfm/unnamed-chunk-62-1.png)<!-- -->

How to interpret this? That’s partly up to you. One interpretation is
that most cycle routes start overlapping (within a 500 m buffer at
least) near the city centre. There are many routes near the city centre.
So central routes without cycle infrastructure (that are blue/purple
shades in the maps above) should be prioritised to benefit the highest
number of current *and potential* cycling trips.

An online representation of this can be found in the Propensity to Cycle
Tool (PCT). Note: you can download open access data on cycle ways from
across England and Wales using this tool - see the website
<http://www.pct.bike/> to explore the data interactively and for more
information.

## 6.6 Exercises

  - Identify the busiest routes in Leeds
  - Where are the hills?
  - Download cycleways and compare with commonly used routes - where’s
    the biggest difference?

# 7\. Wrapping-up

R is a programming language. Learning any language, especially a
programming language is hard, so don’t feel discouraged if not all your
code runs. It takes persistance. And there are dozens of community
groups where you can get involved and ask questions, primarily the
[RStudio community](https://community.rstudio.com/).

There is much more to learn and the recommended step, after
consolidating the content in this practical, is to find important
real-world problems and tackle them. R can be one more tool, a free and
open tool, to help take on city planning challenges and injustices.

In terms of further R resources, there is lots out there,
    including:

  - <https://uk.sagepub.com/en-gb/eur/an-introduction-to-r-for-spatial-analysis-and-mapping/book241031>
  - <https://www.springer.com/gb/book/9781461476177>
  - <https://cengel.github.io/rspatial/>
  - <https://geocompr.robinlovelace.net/> especially the transport
    chapter
