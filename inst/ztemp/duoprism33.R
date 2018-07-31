library(cxhull)

a = sqrt(3)/2
vertices <- rbind(
  c(a, 0.5, a, 0.5),
  c(a, 0.5, -a, 0.5),
  c(a , 0.5, 0, -1),
  c(-a, 0.5, a, 0.5),
  c(-a, 0.5, -a, 0.5),
  c(-a, 0.5, 0, -1),
  c(0, -1, a, 0.5),
  c(0, -1, -a, 0.5),
  c(0, -1, 0, -1)
)


hull <- cxhull(vertices)

# calculation of volume
1/4 * sum(sapply(hull$facets, 
                 function(f) crossprod(f[["center"]], f[["normal"]])) * 
            sapply(hull$facets, "[[", "volume"))

edge <- vertices[hull$edges[1,1],] - vertices[hull$edges[1,2],]
a <- sqrt(c(crossprod(edge)))
3/16*a^4

hypervolume::hypervolume(as.data.frame(vertices), method="box")

