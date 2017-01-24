## This function would generate inverse of an invertible matrix, 
## it will not generate errors if the matrix is un-invertible. 
## 

## This function would create a special matrix which would be used to cache the inverse,
## the function would return a list which could be used to store pointers to the cache location
## this will help in reducing the computation time for complex calculation by first checking in cache.
## this function would create a matrix in a different environment

makeCacheMatrix <- function(x = matrix()) {
        m <- NULL
        set <- function(y) {
                x <<- y
                m <<- NULL
        }
        get <- function() x
        setMetricInverse <- function(solve) m <<- solve
        getMetricInverse <- function() m
        list (set = set, get = get, setMetricInverse = setMetricInverse, 
              getMetricInverse = getMetricInverse )
        }


## this function would check if the reslult is alread stored in cache 
## if present it will retrun the value from cache with the message. 

cacheSolve <- function(x1=matrix(), ...) {
        ## Return a matrix that is the inverse of 'x'
        m <-x1$getMetricInverse()
        if (!is.null(m)) {
                message("getting cache data")
                return(m)
        }
        data <- x1$get()
        m <- solve(data)
        x1$setMetricInverse(m)
        m
        
}
