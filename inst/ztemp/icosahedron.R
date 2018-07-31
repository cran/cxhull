library(cxhull)

vertices <- t(rgl::icosahedron3d()$vb[1:3,])

hull <- cxhull(vertices)

# calculation of volume
1/3*sum(sapply(hull$facets, function(f) crossprod(f$center, f$normal)) * 
  sapply(hull$facets, "[[", "volume"))

edge <- vertices[hull$edges[1,1],] - vertices[hull$edges[1,2],]
a <- sqrt(c(crossprod(edge)))
5/12*(3+sqrt(5))*a^3

hypervolume::hypervolume(as.data.frame(vertices))
