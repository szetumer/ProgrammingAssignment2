## These functions allow users to store matrix inverses in a cache,
## Rather than recalculate them every time

##This fun. creates a list that stores both the matrix and the inverse.
makeCacheMatrix <- function(x = numeric()){
        #we want the matrix to have these functions: set, get, setmean, getmean
        inverse <- NULL
        set <- function(y){
                x <<- y
                m <<- NULL
        }
        get <- function() x
        setinverse <- function(inv) inverse <<- inv
        getinverse <- function() inverse
        list(set = set, get = get, setinverse = setinverse, getinverse = getinverse)
}

##This function either retrieves the inverse, if calculated, or calculates the inverse.
cacheSolve <- function(x, ...){
        inverse <- x$getinverse()
        if(!is.null(inverse)){
                message("<beep boop beep> RETRIEVING CACHED INVERSE")
                return(inverse)
        }
        wholematrix <- x$get()
        inv <- solve(wholematrix)
        x$setinverse(inv)
        inv
}