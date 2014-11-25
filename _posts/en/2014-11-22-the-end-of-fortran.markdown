---
layout:     post
title:      The End of Fortran
date:       2014-11-22
categories: research
name:       endoffortran
---
One of my main interest is the end of Fortran *as the only programming language
used by mathematicias*. If you're not in the area of mathematical programming,
you probably find it strange for me to be talking about Fortran, so I explain.
Fortran is considered the fastest programming language in mathematics, and most
things made are in this language. Other often used languages such as
MatLab/Octave and Mathematica are high-level, which means they are slower and
are not considered for serious applications.

In reality, Fortran is one of the fastest programming language *for linear
algebra with dense matrices*. Since most things in this area are matrices, and
most vectors are dense, this can't be overlooked. In addition, fortran has a
relatively easy way to go, bypassing the painstankingly formatting and GOTO,
which were left behind by the newer versions.

The problem is that, since learning Fortran is almost imperative in the area,
there is little else used to code in the area. Hence, easy tasks without need of
fast execution become hard programming jobs. And furthermore, tasks that need
fast execution, but can't (shouldn't) be implement as matrices, become slow in
Fortran, and sometimes this is overlooked.

My proposition is *use the best tool for the job*, which is just common sense,
but applied to our area. Try [Python](http://www.python.org). Try
[Ruby](http://www.ruby-lang.org). Try [Julia](http://www.julia-lang.org). Try
to implementing a graph using a list of pointers. Try to implement a argument
parser. Try to implement reading, storing, and calculating the transpose of a
sparse matrix. Try to implement a tool to read all citations on your .tex, read
from a bibtex file such references and print then all in a nice format.

Now, rather than stay in that language, go for another. Try other languages.
When the job comes, you can choose the best tool for it. And you can combine.
Some languages, such as Julia, Fortran and C, are very easy to combine with
others. Implement your algorithm in Julia, then improve it later with Fortran.
And if you are really in need of speed, why not implement the hardest part in
machine language (ASSEMBLY)?
Implementing the fastest possible algorithm is very good for a specific
application, but in our line of work, we must take into account the method, not
only the implementation.
