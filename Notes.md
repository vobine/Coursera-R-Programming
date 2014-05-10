# Notes for R Programming

## Lecture 1 20140510

* Preliminary: R Studio deals with working directories as projects,
  which is a bit different from the R interface described in the
  lecture. I hope this will be a non-issue, as I'm putting the course
  into a project. We'll see.

* Overview and history: S hasn't changed significantly since 1998. R
  began in 1991, went GPL in 1995. Similarity between R and S is
  syntactic; semantically they are very different!

* Getting help: Pals; Google; forum; email.

* Introduction to R language.

Atomic classes: character, numeric, integer, complex, logical.

Vectors

** Numbers: L suffix makes an integer, else double precision floating
   point. Inf and NaN work.

** Objects can have attributes, e.g., names, dimnames, dimensions,
   class, length, etc. Set or modify with attributes() function.

** <- for assignment, # for comments. Double quotes delimit
   strings. print function displays its argument.

** Colon creates sequences.

** c() function ("concatenate") creates vectors, e.g., c('a', 'b',
   'c'). vector() creates a vector of a specified size and type
   with unspecified initial values.

** T, TRUE, F, FALSE are synonyms for Boolean constants.

** Coercion functions are named "as.*type*" by convention.

** Matrices: rows, columns, e.g., m <- matrix(nrow=2, ncol=3)
   dim(m)
   Constructed column-wise, e.g., matrix(1:6, nrow=2 nrow=3)
   Or m <- 1:10
   dim(m) <- c(2,5)
   cbind, rbind

** Lists, created by l <- list(), are vectors with mixed
   types. Printed representation is like a vector but with indices in
   doubled brackets.

