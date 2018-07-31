library(cxhull)

a = 1/sqrt(sqrt(2))
vertices <- rbind(
  c(0,sqrt(2),a),
  c(0,-sqrt(2),a),
  c(sqrt(2),0,a),
  c(-sqrt(2),0,a),
  c(-1,-1,-a),
  c(-1,1,-a),
  c(1,-1,-a),
  c(1,1,-a)
)

hull <- cxhull(vertices)

hull$edges

apply(vertices, 1, function(xx) sprintf("<%s>", paste0(xx, collapse=","))) -> vv
paste0(vv, collapse=", ")

apply(hull$edges-1, 1, function(xx) sprintf("{%s}", paste0(xx, collapse=","))) -> eee
cat(paste0(eee, collapse=", "))
