# ggmodel
A function collection to plot R base model objects with ggplot2

## How to install

To install the `ggmodel` you will need to install the `devtools` package.

In case you don't have devtools, run the following line:
`install.packages("devtools")`

```{r}
library(devtools)
install_github("wilsonfrantine/ggmodel")
```

## A simple example

```{r}
#create a lm or glm model
m <- glm(mpg ~ wt + hp, data = mtcars)

#Ploting a response surface for the multiple model
ggsurface(m, x.name="Weight", y.name="Horsepower",
    legend.title="Miles per Gallon", col.low = "white",
    col.high = "blue")
```


At the moment, the package is very prototype. 
It just have one function for plotting multiple lm or glm surfaces
`ggsurface()`

To get help try

```{r}
?ggsurface
```

