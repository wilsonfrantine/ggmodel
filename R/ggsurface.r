#' @title Plot Model Surface with ggplot2
#' @description a ggplot2 surface plot function for R base glm or lm models
#' @author Wilson Frantine-Silva
#' @name ggsurface
#' @export
#' @param m an glm or lm R base object model
#' @param x.name a name for the x axis. Default = NULL. The var name from the model will be used if no value is provided
#' @param y.name a name for the x axis. Default = NULL. The var name from the model will be used if no value is provided
#' @param legend.title a name for the scale surface values. Default = NULL. If no values is provided the response variable name from the model is used.
#' @param col.low the color of the response var lowest value. It might be a standard color name, hexadecimal or rgb generated (from the function rgb()).
#' @param col.high the color of the response var highest value. It might be a standard color name, hexadecimal or rgb generated (from the function rgb()).
#' @usage ggsurface(m, x.name, y.name, legend.title, col.low, col.high)
#' @examples m <- glm(mpg ~ wt + hp, data = mtcars)
#' ggsurface(m, x.name="Weight", y.name="Horsepower",
#' legend.title="Miles per Gallon", col.low = "white",
#' col.high = "blue")

ggsurface <- function(m, x.name = NULL, y.name= NULL, legend.title=NULL, col.low=  "#EEEEFF", col.high = "#000066" ){
#Var definitions
  xgrid <-  base::seq(base::min(m$model[2]),
                      base::max(m$model[2]),
                      base::diff(base::range(m$model[2]))/20)
  ygrid <-  base::seq(base::min(m$model[3]),
                      base::max(m$model[3]),
                      base::diff(base::range(m$model[3]))/20)

  d.fit <-  base::expand.grid(xgrid, ygrid)
  base::names(d.fit) <- c(base::names(m$model[2]), base::names(m$model[3]))

  prediction <- stats::predict(m, newdata=d.fit)

  d.fit <- base::cbind(d.fit, prediction)

  if(is.null(x.name)){
    x.name <- base::names(d.fit[1])
  }
  if(is.null(y.name)){
    y.name <- base::names(d.fit[2])
  }
  if(is.null(legend.title)){
    legend.title <- base::names(m$model[1])
  }

  var.names <- c(x.name, y.name, legend.title)
  base::names(d.fit) <- c("x","y","z")

  col1<-col.low
  col2<-col.high
  legend.name   = legend.title
  legend.breaks = base::as.numeric(base::round(stats::quantile( stats::runif(100, base::range(d.fit$z)[1], base::range(d.fit$z)[2]), base::seq(0,1,0.1)),1))
  legend.labels <- base::round(legend.breaks)
  legend.labels[c(0,2,4,6,8,10)]<-""

  x <- d.fit$x
  y <- d.fit$y
  z <- d.fit$z

  #plot building

  p <-  ggplot2::ggplot(d.fit, ggplot2::aes(x=x,y=y))+
    ggplot2::geom_tile(d.fit, mapping= ggplot2::aes(x=mean(x), y=mean(y),fill=z))+
    ggplot2::scale_fill_gradient(low=col1, high = col2,
                        labels= legend.labels,
                        breaks= legend.breaks,
                        guide = ggplot2::guide_legend(
                          title = legend.title,
                          title.position = "left",
                          title.hjust = 0.5,
                          title.theme    = ggplot2::element_text(
                            face  ="italic",
                            angle = 90,
                            vjust = 0.5,
                            hjust = 0.5
                          ),
                          reverse = T
                        )
    )+
    ggnewscale::new_scale("fill")+
    ggplot2::geom_contour_filled(data=d.fit, ggplot2::aes(x = x, y = y, z = z),
                        show.legend = F, bins = 20, alpha=1)+
    ggplot2::labs(x = var.names[1], y = var.names[2])+
    ggplot2::scale_y_continuous(expand=c(0,0), n.breaks = 10)+
    ggplot2::scale_x_continuous(expand = c(0,0), n.breaks = 10)+
    ggplot2::theme(
      axis.text = ggplot2::element_text(colour = "black" ),
      panel.grid.minor = ggplot2::element_blank(),
      panel.border = ggplot2::element_rect(fill=NA),
      panel.ontop = T,
      panel.background = ggplot2::element_rect(fill = NA),
      panel.grid = ggplot2::element_line(colour = grDevices::rgb(1,1,1,0.05), linetype = "solid"),
      axis.line = ggplot2::element_blank(),
      plot.margin = ggplot2::unit(x = c(5,5,5,5), "mm"),
      legend.key = ggplot2::element_rect(color="black")
    )+
    ggplot2::scale_fill_manual( values= grDevices::colorRampPalette(c(col2, col1))(20) )

  return(p)

}
