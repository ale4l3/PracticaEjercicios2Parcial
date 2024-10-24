unit UNodo;
{$mode objfpc}
interface 
 type
  Nodo=class
   private
    dato: string;
    siguiente: Nodo;
    soyElUltimo: boolean;

   public
    constructor create(unDato: string);
    procedure agregar(unNodo:Nodo);
    procedure imprimir();
    procedure imprimirInverso();
    function  contar():integer;
end;
implementation

	constructor Nodo.create(unDato: string);
	begin
		dato:=unDato;
		soyElUltimo:=true;
	end;
	
	procedure Nodo.agregar(unNodo:Nodo);
	begin
		if soyElUltimo then
		begin
			siguiente:= unNodo;
			soyElUltimo:=false;
		end
		else
			siguiente.agregar(unNodo);
		
	end;

	
	procedure Nodo.imprimir();
	begin
		writeln(dato);
		if not soyElUltimo then
			siguiente.imprimir();
	end;
	
	procedure Nodo.imprimirInverso();
	begin
		if not soyElUltimo then
			siguiente.imprimirInverso();
		writeln(dato);
	end;
    function Nodo.contar():integer;
    begin
		if soyElUltimo then
			Nodo.contar():= 1;
		if not soyElUltimo then
			siguiente.contar():= siguiente.contar() + 1;
    end;
end.
