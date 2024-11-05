program PNombre;

uses UABBgenerico, URandomGenerator, UCadena;

procedure cargarArbol(abb: ABBgenerico);
var
rg:RandomGenerator;
s:string;
begin
	rg:= RandomGenerator.create();
	rg.addLabel('Carla');
	rg.addLabel('Roberto');
	rg.addLabel('Carlos');
	rg.addLabel('Agustin');
	rg.addLabel('Jose');
	rg.addLabel('Ariel');
	rg.addLabel('Leandro');
	rg.addLabel('Pedro');
	rg.addLabel('ZZZ');
	s:=rg.getLabel ;
	while s  <> 'ZZZ' do begin
		abb.agregar(Cadena.create(s));
		s:=rg.getLabel ;
	end;
end;
procedure existeNombre (abb: ABBgenerico; n:string);
begin
	if abb.existeElemento(Cadena.create(n)) then
		writeln('El nombre: ',n, ' existe')
	else
		writeln('El nombre: ',n, ' no existe');
end;
procedure imprimirEnOrden (abb: ABBgenerico);
begin
	
end;
var
	n, n2:string;
	abb: ABBgenerico;
BEGIN
	abb:= ABBgenerico.create();
	n:= 'Carla';
	n2:= 'Alejandro';
	cargarArbol(abb);
	existeNombre(abb, n);
	existeNombre(abb, n2);
	abb.imprimirEnOrden();
	writeln ('Escribir un nombre: '); readln(n);
	writeln ('Escribir un nombre: '); readln(n2);
	abb.imprimirAcotado(Cadena.create(n), Cadena.create(n2))
END.

