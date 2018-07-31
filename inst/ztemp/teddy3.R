library(cxhull)

phi = (1+sqrt(5))/2
vertices <- rbind(
  c(1,1,1,phi^2),
  c(1,-1,-1,phi^2),
  c(-1,1,-1,phi^2),
  c(-1,-1,1,phi^2),
  c(phi,phi,phi,0),
  c(phi,-phi,-phi,0),
  c(-phi,phi,-phi,0),
  c(-phi,-phi,phi,0),
  c(2,0,0,-phi),
  c(-2,0,0,-phi),
  c(0,2,0,-phi),
  c(0,-2,0,-phi),
  c(0,0,2,-phi),
  c(0,0,-2,-phi)
)

hull <- cxhull(vertices)


apply(round(vertices,2), 1, function(xx) sprintf("<%s>", paste0(xx, collapse=","))) -> vv
paste0(vv, collapse=", ")

apply(hull$edges-1, 1, function(xx) sprintf("{%s}", paste0(xx, collapse=","))) -> eee
cat(paste0(eee, collapse=", "))
