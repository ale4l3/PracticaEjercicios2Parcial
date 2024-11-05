unit UNodo;
{$mode objfpc}
interface
	type
		Nodo = class
			private
				elemento: integer;
				hijoIzquierdo, hijoDerecho: Nodo;
				tengoHijoIzquierdo, tengoHijoDerecho: boolean;
			public
				constructor create(unElemento: integer);
				procedure agregar(unNodo: Nodo);
				function contar(): integer;
				function getElemento():integer;
				function existeElemento(unElemento: integer): boolean;
				procedure imprimir();
				procedure imprimirInverso();
				procedure imprimirPreOrden();
				procedure imprimirPostOrden();
				function minimo(): integer;
				function maximo(): integer;
				procedure  imprimirMenores(unValor: integer);
				procedure  imprimirMayores(unValor: integer);
				procedure imprimirAcotado(unValorMin, unValorMax: integer);
		end;

	
implementation

	constructor Nodo.create(unElemento:integer);
	begin
		elemento:= unElemento;
		tengoHijoIzquierdo:= false;
		tengoHijoDerecho:= false;
	end;
	
	procedure Nodo.agregar(unNodo: Nodo);
	begin
		if unNodo.getElemento() < elemento then begin
			if tengoHijoIzquierdo then hijoIzquierdo.agregar(unNodo)
			else begin
				hijoIzquierdo:= unNodo;
				tengoHijoIzquierdo := true;
			end;
			end
		else
			begin
			if tengoHijoDerecho then hijoDerecho.agregar(unNodo)
			else begin
				hijoDerecho:= unNodo;
				tengoHijoDerecho := true;
			end;
		end;
	end;
	
	function Nodo.existeElemento(unElemento: integer): boolean;
	begin
		if elemento = unElemento then existeElemento:= true
		else
			if unElemento < elemento then begin
				if tengoHijoIzquierdo then
				existeElemento:= hijoIzquierdo.existeElemento(unElemento)
				else
				existeElemento:= false
			end
			else
			begin
				if tengoHijoDerecho then
				existeElemento:= hijoDerecho.existeElemento(unElemento)
				else
				existeElemento:= false
		end;
	end;
	
	function Nodo.contar(): integer;
	var cont: integer;
	begin
		cont:= 0;
		if tengoHijoIzquierdo then
			cont:= cont + hijoIzquierdo.contar();
		if tengoHijoDerecho then
			cont:= cont + hijoDerecho.contar();
		contar:= cont + 1;
	end;
	
	function Nodo.getElemento():integer;
	begin
		getElemento := elemento;
	end;
	
	procedure Nodo.imprimir();
	begin
		if tengoHijoIzquierdo then
			hijoIzquierdo.imprimir();
		writeln(elemento);
		if tengoHijoDerecho then
			hijoDerecho.imprimir();
	end;
	
	procedure Nodo.imprimirInverso();
	begin
			if tengoHijoDerecho then
				hijoDerecho.imprimirInverso();
			writeln(elemento);
			if tengoHijoIzquierdo then
				hijoIzquierdo.imprimirInverso();
	end;
	
	procedure Nodo.imprimirPreOrden();
	begin
		writeln(elemento);
		if tengoHijoIzquierdo then
			hijoIzquierdo.imprimirPreOrden();
		if tengoHijoDerecho then
			hijoDerecho.imprimirPreOrden();
	end;
	
	procedure Nodo.imprimirPostOrden();
	begin
		if tengoHijoIzquierdo then
			hijoIzquierdo.imprimirPostOrden();
		if tengoHijoDerecho then
			hijoDerecho.imprimirPostOrden();
		writeln(elemento);
	end;
	
	function Nodo.minimo(): integer;
	begin
		if tengoHijoIzquierdo then
			minimo:= hijoIzquierdo.minimo
		else
			minimo:= elemento;
	end;
	
	function Nodo.maximo(): integer;
	begin
		if tengoHijoDerecho then
			maximo:= hijoDerecho.maximo
		else
			maximo:= elemento;
	end;
	
	procedure Nodo.imprimirMenores(unValor: integer);
	begin
		if (elemento <= unValor) then
		begin
			if tengoHijoIzquierdo then
				hijoIzquierdo.imprimirMenores(unValor);
				writeln(elemento);
			if tengoHijoDerecho then
				hijoDerecho.imprimirMenores(unValor);
		end
		else
			if tengoHijoIzquierdo then
				hijoIzquierdo.imprimirMenores(unValor);
	end;
	
		procedure Nodo.imprimirMayores(unValor: integer);
		begin
			if (elemento >= unValor) then
			begin
				if tengoHijoDerecho then
					hijoDerecho.imprimirMayores(unValor);
				writeln(elemento);
				if tengoHijoIzquierdo then
					hijoIzquierdo.imprimirMayores(unValor);
			end
			else
				if tengoHijoDerecho then
					hijoDerecho.imprimirMayores(unValor);
		end;
	
		procedure Nodo.imprimirAcotado(unValorMin, unValorMax: integer);
		begin
			if (elemento >= unValorMin) and (elemento<=unValorMax) then
			begin
				if tengoHijoIzquierdo then
					hijoIzquierdo.imprimirAcotado(unValorMin, unValorMax);
				writeln(elemento);
				if tengoHijoDerecho then
					hijoDerecho.imprimirAcotado(unValorMin, unValorMax);
			end
			else
				if (elemento < unValorMin) then
				begin
					if tengoHijoDerecho then 
						hijoDerecho.imprimirAcotado(unValorMin, unValorMax);
				end
				else
					if tengoHijoIzquierdo then
						hijoIzquierdo.imprimirAcotado(unValorMin, unValorMax);
		end;
	
end.
