program Arbol;
{$mode objfpc}
uses UABB, UNodo;

var 
	a: ABB;
	i,n: integer;
	b:boolean;

BEGIN
	randomize;
	a:= ABB.create();
	for i:=1 to 20 do begin
		n:= random (30) + 1;
		a.agregar(n);
	end;

	b:= a.existeElemento(5);
	if b then
		writeln('Existe el elemento 5')
	else
		writeln('No existe el elemento 5');
	n:= a.cantidadDeElementos();
	writeln('La cantidad de elementos es: ', n) ;
	a.imprimir();
	writeln('/////////////////////////');
	a.imprimirInverso();
	writeln('/////////////////////////');
	a.imprimirPostOrden();
	writeln('/////////////////////////');
	a.imprimirPreOrden();
	
END.

