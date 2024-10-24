{
      
}


unit ULista;

interface
	
	uses UNodo;
	
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
		
implementation

		constructor Lista.create();
		begin
			estoyVacia:= true;
		end;
		
		procedure Lista.agregar(unDato:string);
		var n: Nodo;
			begin
			n:= Nodo.create(unDato);
			if estoyVacia then begin
				estoyVacia:= false;
				primerElemento:= n;
			end
			else 
			primerElemento.agregar(n);
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
			
		end;
		function Lista.cantidadDeDatos(): integer;
		begin
			
		end;


end.

