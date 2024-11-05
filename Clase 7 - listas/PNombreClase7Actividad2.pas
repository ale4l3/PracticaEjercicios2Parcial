program PNombresClase7Actividad2;

uses UNodoClase7;

procedure cargarNombre(var n:string);
	var 
		vLocal:array[1..10] of string= ('a', 'b', 'e', 'f','g','h','i','j','k','p');
	begin 
		n:= vLocal[random(9)+1];
	end;

var 
	primerNodo, siguiente : nodo;
	nombre:string;
	i:integer;
BEGIN
	cargarNombre(nombre);
	primerNodo:= Nodo.create(nombre);
	for i:=1 to 20 do begin
		cargarNombre(nombre);
		siguiente:= Nodo.create(nombre);
		primerNodo.agregar(siguiente);
	end;
	
	primerNodo.imprimir();
	writeln(':::::::::::::::::::::::::::');
	primerNodo.imprimirInverso();
	
END.

