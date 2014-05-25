## The function creates a special "matrix" object that can cache its inverse and computes the inverse it
## If the inverse has already been calculated then the cachesolve should retrieve the inverse from the cache.

## 1. Creates a special "matrix" object that can cache its inverse
makeCacheMatrix <- function(x = matrix()) {
  m<-NULL
  set<-function(y){
  x<<-y
  m<<-NULL
}
get<-function() x
setmatrix<-function(solve) m<<- solve
getmatrix<-function() m
list(set=set, get=get,
   setmatrix=setmatrix,
   getmatrix=getmatrix)
}


## 2. If the inverse has already been calculated retrieve from the cache

cacheSolve <- function(x=matrix(), ...) {
    m<-x$getmatrix()
    if(!is.null(m)){ return(m)
    	}
    else { matrix<-x$get()
    	m<-solve(matrix, ...)
    	x$setmatrix(m)
    	m}
}

