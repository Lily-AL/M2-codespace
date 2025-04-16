needsPackage "randoBinomials"
R=ZZ/101[a..d]
B = flatten entries basis(3, R)
randoBinomials = (m, B) -> (
  n=length B;
  Gen={};
  while (length Gen) < 2*m  do(
    L = random toList(0 .. n-1);
    Gen = Gen | {B_(L_0)-B_(L_1),B_(L_1)-B_(L_0)};
    Gen = toList set Gen;
  );
  trim ideal Gen
)

randoBinomials(4, B)