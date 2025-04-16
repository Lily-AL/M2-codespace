 -- -*- coding: utf-8 -*-  

newPackage(
  "randoBinomials",
  Version => "1.1",
  Date => "March 15, 2025",
  Authors => {{Name => "Lily AL", Email => "lilia.alanislpz@tec.mx", HomePage => "https://sites.google.com/tec.mx/liliaalanislopez/"}},
  Headline => "an example Macaulay2 package assignment in Workshop 2025 at Tulane University",
  Keywords => {"Documentation"},
  DebuggingMode => false
 )

export{"randoBinomials"}

randoBinomials = method(TypicalValue => Ideal)

randoBinomials (ZZ,List) := Ideal => (m, B) -> (
  n=length B;
  R={};
  while (length R) < 2*m  do(
    L = random toList(0 .. n-1);
    R = R | {B_(L_0)-B_(L_1),B_(L_1)-B_(L_0)};
    B1 = set R;
    R = toList B1;
  );
  ideal R
)

beginDocumentation()

doc///
Node
  Key 
    randoBinomials
    (randoBinomials, ZZ, List)

  Headline
    an example Macaulay2 package assignment in Workshop 2025 at Tulane University

  Usage
    I=randoBinomials(m, B)

  Inputs
    m:ZZ       -- positive
    B:List     -- which are monomials of certain homogeneous degree

  Outputs
    I:Ideal
      An ideal generated with {\tt m} different diferences between monomials
      in {\tt B}.

  Consequences
   Item
    The first side effect of the function, if any, is described here.

  Description
    Text
      This package provides a function that takes a list of monomials of a certain degree and
      generates an Ideal generated with {\tt m} different binomials in {\tt R}.

    Example
      R = ZZ/101[a..d];
      B = flatten entries basis(3, R);
      randoBinomials(4, B)    

  Acknowledgement
    Acknowledge funding housing for the workshop.
  Contributors
    Acknowledge Mike and Anton for their patience.
  References
    Provide references for further reading.
  Caveat
    This is not a particularly useful function.
  SeeAlso
    "trim"
    "mingens"
///

TEST///
check(10, randoBinomials)
///

end--