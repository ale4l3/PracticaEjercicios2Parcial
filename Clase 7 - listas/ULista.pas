{
}


unit ULista;
{$mode objfpc}

interface
	
	uses UNodoClase7;
	type
		Lista = class
		private
			primerElemento:Nodo;
			estoyVacia: boolean;
		public
			constructor create();
			procedure agregar(unDato:string);
			procedure imprimir();
			procedure imprimirInverso();
			function cantidadDeDatos(): integer;
			function estasVacia: boolean;
			function existeElemento(unDato: string): boolean;
			procedure imprimirMenores(unLimite: string);
			procedure imprimirMayores(unLimite: string);
			procedure imprimirAcotado(unLimiteMin, unLimiteMax: string);
		end;
		
implementation

		constructor Lista.create();
		begin
			estoyVacia:= true;
		end;
		
		procedure Lista.agregar(unDato:string);
			begin
			if estoyVacia then begin
				estoyVacia:= false;
				primerElemento:= Nodo.create(unDato);
			end
			else 
				primerElemento.agregar(Nodo.create(unDato));
		end;
		
		procedure Lista.imprimir();
		begin
			if not estoyVacia then
				primerElemento.imprimir();
		end;
		
		function Lista.estasVacia():boolean;
		begin
			estasVacia:= estoyVacia;
		end;
		
		procedure Lista.imprimirInverso();
		begin
			if not estoyVacia then
				primerElemento.imprimirInverso();
		end;
		
		function Lista.cantidadDeDatos(): integer;
		begin
			if not estoyVacia then
				cantidadDeDatos:= primerElemento.contar()
			else	
				cantidadDeDatos:=0;
		end;

		function Lista.existeElemento(unDato: string): boolean;
		begin
			if not estoyVacia then
				existeElemento := primerElemento.existeElemento(unDato);
		end;
		
		procedure Lista.imprimirMenores(unLimite: string);
		begin
			if not estoyVacia then
				primerElemento.imprimirMenores(unLimite);
		end;
		
		procedure Lista.imprimirMayores(unLimite: string);
		begin
			if not estoyVacia then
				primerElemento.imprimirMayores(unLimite);
		end;
		
		procedure Lista.imprimirAcotado(unLimiteMin, unLimiteMax: string);
		begin
			if not estoyVacia then
				primerElemento.imprimirAcotado(unLimiteMin, unLimiteMax);
		end;
    
end.

