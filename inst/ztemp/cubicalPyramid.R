library(cxhull)

vertices <- rbind(
  c(-1,-1,-1,0),
  c(-1,-1,1,0),
  c(-1,1,-1,0),
  c(-1,1,1,0),
  c(1,-1,-1,0),
  c(1,-1,1,0),
  c(1,1,-1,0),
  c(1,1,1,0),
  c(0,0,0,1)
)

hull <- cxhull(vertices)

hull$edges

apply(vertices, 1, function(xx) sprintf("<%s>", paste0(xx, collapse=","))) -> vv
paste0(vv, collapse=", ")

apply(hull$edges, 1, function(xx) sprintf("{%s}", paste0(xx, collapse=","))) -> eee
cat(paste0(eee, collapse=", "))
