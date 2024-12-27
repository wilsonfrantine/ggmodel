# <img src="https://cdn-icons-png.flaticon.com/512/2280/2280566.png" width=40px align="center" /> ggmodel – *Visualize Base R Models with ggplot2* 🚧  

**ggmodel** is an R package aimed at transforming model outputs from base R into **beautiful 2D visualizations using ggplot2**. 📊  
Currently, **the package is in beta** and includes **one core function** – `ggsurface` – designed to generate **2D surface plots** from linear, generalized linear, and loess models.  

---

## ✨ Features  

- 🔍 **2D Model Surface Plots** – Visualize interactions between two predictors in your model.  
- ⚙️ **Compatible with Base R Models** – Works with `lm`, `glm`, and `loess` objects.  
- 🎨 **Fully Customizable** – Tailor colors, grid sizes, and legend labels using intuitive arguments.  
- 🚀 **Simple & Efficient** – Minimal code to produce publication-ready surface plots.  

---

## 📥 Installation  

Install the development version of **ggmodel** from GitHub:  

```r
# Install remotes package if not already installed
install.packages("remotes")

# Install ggmodel (beta)
remotes::install_github("wilsonfrantine/ggmodel")
```

---

## 🚀 Quick Demo  

Here’s what you can do with the current version of `ggmodel`:  

```r
# Load necessary libraries
library(ggmodel)

# Fit a basic linear model
model <- lm(mpg ~ wt + hp, data = mtcars)

# Visualize model surface
ggsurface(model, x.var = "wt", y.var = "hp", legend.title = "Miles per Gallon")
```

The plot will show how **weight (`wt`)** and **horsepower (`hp`)** interact to influence **miles per gallon (`mpg`)**.  
👉 For a full tutorial, visit the [ggmodel project page](https://wilsonfrantine.github.io/ggmodel).  

---

## 🛠️ Function Details  

### `ggsurface()` – The Core of ggmodel  

`ggsurface` is a versatile function that generates **2D model surface plots** for regression models in R.   

**Supported Models:**  
- `lm` – Linear Models  
- `glm` – Generalized Linear Models  
- `loess` – Local Polynomial Regression  

**Key Arguments:**  
- `m` – Model object (`lm`, `glm`, or `loess`).  
- `x.var` – Name of the predictor variable for the x-axis.  
- `y.var` – Name of the predictor variable for the y-axis.  
- `legend.title` – Title for the legend (default: response variable name).  
- `xgrid.size` / `ygrid.size` – Grid resolution (default: 15).  
- `low.col` / `high.col` – Gradient colors for low and high surface values.  
- `n.bins` – Number of bins for discretizing the surface (default: 10).  
- `scale.type` – Prediction scale (`link` or `response`).  

---

## 🔨 Roadmap  

🔧 Although **ggmodel** currently focuses on **surface plots**, future updates will include:  
- 📊 **Coefficient Plots** – Visualize model coefficients with confidence intervals.  
- 📈 **Residual Analysis** – Expanded diagnostic plots for GLMs.  
- 🧩 **Support for More Models** – Compatibility with `gam` (Generalized Additive Models) and mixed models.  

---

## 🤝 Contributing  

Since **ggmodel** is in **early development**, contributions are encouraged and highly appreciated!  

- 🐛 **Found a bug?** Open an issue!  
- 🚀 **Have ideas for new functions?** Submit a pull request or request features.  
- 💬 **Feedback or suggestions?** Let us know through [GitHub Issues](https://github.com/wilsonfrantine/ggmodel/issues).  

---

## 📜 License  

This project is licensed under the **GPL License**.  

---

### 🚧 Disclaimer  

**ggmodel is in beta.** While functional, the package currently offers limited features. Expect new additions soon!  
