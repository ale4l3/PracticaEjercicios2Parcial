unit UNodoClase7;
{$mode objfpc}

interface 
 type
	Nodo = class
	   private
			dato: string;
			siguiente: Nodo;
			soyElUltimo: boolean;

	   public
			constructor create(unDato: string);
			procedure agregar(unNodo:Nodo);
			procedure imprimir();
			procedure imprimirInverso();
			function contar():integer;
			function existeElemento(unDato:string):boolean;
			procedure imprimirMenores(unLimite: string); // Suponiendo que la lista está ordenada de menor a mayor // imprime los valores menores que “unLimite” de menor a mayor.
			procedure imprimirMayores(unLimite: string); // Suponiendo que la lista está ordenada de menor a mayor // imprime los valores mayores que “unLimite”, de menor a mayor.
			procedure imprimirAcotado(unLimiteMin, unLimiteMax: string);
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
		if not soyElUltimo then
			contar:= 1 + siguiente.contar
		else 
			contar:= 1;
    end;
    
    function Nodo.existeElemento(unDato:string):boolean;
    begin
		if (unDato = dato) then
			existeElemento:= true
		else 
			if not soyElUltimo then
				existeElemento:= siguiente.existeElemento(unDato)
			else
				existeElemento:= false;
    end;
    
    procedure Nodo.imprimirMenores(unLimite: string); 
    begin
		if (dato < unLimite) and not soyElUltimo then begin
			writeln(dato);
			siguiente.imprimirMenores(unLimite);
		end
		else
			if (dato < unLimite) and soyElUltimo then 
				writeln(dato);
    end;
    
	procedure Nodo.imprimirMayores(unLimite: string);
	begin
		if (dato < unLimite) and not soyElUltimo then 
			siguiente.imprimirMayores(unLimite)
		else
			if not soyElUltimo then begin
				writeln(dato);
				siguiente.imprimirMayores(unLimite);
			end
			else
				writeln(dato);
    end;
    
	procedure Nodo.imprimirAcotado(unLimiteMin, unLimiteMax: string);
	begin
	
		if (dato > unLimiteMin) and (dato < unLimiteMax) then
					writeln(dato);
					
		if not soyElUltimo  then 
					siguiente.imprimirAcotado(unLimiteMin, unLimiteMax);
    end;
    
end.
