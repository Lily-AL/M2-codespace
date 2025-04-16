 -- -*- coding: utf-8 -*-  

newPackage(
  "FirstLilyAttempt",
  Version => "0.0",
  Date => "April 15, 2025",
  Authors => {{Name => "Lily AL", Email => "lilia.alanislpz@tec.mx", HomePage => "https://sites.google.com/tec.mx/liliaalanislopez/"}},
  Headline => "an example Macaulay2 package assignment in Workshop 2025 at Tulane University",
  Keywords => {"Documentation"},
  DebuggingMode => false,
  AuxiliaryFiles => false
 )

export{"randoBinomials"}

randoBinomials = method(TypicalValue => Ideal)

randoBinomials (ZZ,List) := Ideal => (m, B) -> (
  n:=length B;
  Gen:={};
  while (length Gen) < 2*m  do(
    L := random toList(0 .. n-1);
    Gen = Gen | {B_(L_0)-B_(L_1),B_(L_1)-B_(L_0)};
    Gen = toList set Gen;
  );
  trim ideal Gen
)

beginDocumentation()

doc///
Node
  Key 
    FirstLilyAttempt

  Headline
    an example Macaulay2 package assignment in Workshop 2025 at Tulane University

  Usage
    I=randoBinomials(m, B)

  Inputs
    m:ZZ       -- positive
    B:List     -- which are monomials of certain homogeneous degree

  Outputs
    I:Ideal
      An ideal generated with {\tt m} different binomials
      in {\tt B}.

  Consequences
   Item
    The first side effect of the function, is a randomized ideal.

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
-*Test Section*-
end--
restart
debug needsPackage "randoBinomials"
check "randoBinomials"

-*Development Section*-

uninstallPackage "randoBinomials"
restart
installPackage "randoBinomials"
