m<-matrix(c(1, 2, 3, 0,1,4,5,6,0), 3, 3)

#m is inversible
solve(m)

mplus<-makeCacheMatrix(m)
mplus$get
mplus$getinverse()

cacheSolve(mplus) # no cache
cacheSolve(mplus) # cached

mplus$set(m2) # cache reset

cacheSolve(mplus) # no cache
cacheSolve(mplus) # cache


