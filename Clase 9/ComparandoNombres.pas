
program ComparandoNombres;
uses UCadena;
var n1, n2, n3: Cadena;
begin
n1:= Cadena.create('Juan');
n2:= Cadena.create('Paula');
n3:= Cadena.create('Juan');
writeln(n1.equals(n3));
writeln(n1.equals(n2));
writeln(n2.greaterThan(n1));
writeln(n1.lessThan(n2));
writeln(n3.greaterThanOrEquals(n1));
writeln(n2.lessThanOrEquals(n3));
end.
