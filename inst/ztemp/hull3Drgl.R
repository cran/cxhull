setwd("~/MyPackages/cxhull/inst/ztemp")
library(cxhull)
library(rgl)

# generates 50 points in the unit sphere (uniformly)
set.seed(666)
npoints <- 5000
r <- runif(npoints)
theta <- runif(npoints, 0, 2*pi)
v <- runif(npoints, -1, 1)
points <- t(mapply(function(r,theta,v){
  r*c(cos(theta)*sin(acos(v)), sin(theta)*sin(acos(v)), v)
}, r, theta, v))
# computes the triangulated convex hull
hull <- cxhull(points, triangulate = TRUE)
# plot
for(i in 1:length(hull$facets)){
  triangle <- t(sapply(hull$facets[[i]]$vertices, 
                       function(id) hull$vertices[[as.character(id)]]$point))
  triangles3d(triangle, color="blue")
}
