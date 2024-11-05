unit UABB;
{$mode objfpc}
interface
	uses UNodo;
	type
		
		ABB = class
		private
			estoyVacio: boolean;
			raiz: Nodo;
		public
			constructor create();
			procedure  agregar(unElemento: integer);
			function existeElemento(unElemento: integer): boolean;
			function  cantidadDeElementos(): integer;
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

	constructor ABB.create();
	begin
		estoyVacio:= true;
	end;
	
	procedure ABB.agregar(unElemento: integer);
	var n: Nodo;
	begin
		n:= Nodo.create(unElemento);
		if estoyVacio then begin
			raiz:= n;
			estoyVacio:= false;
		end
		else raiz.agregar(n);
	end;
	
	function ABB.existeElemento(unElemento: integer): boolean;
	begin
	if not estoyVacio then
		existeElemento:= raiz.existeElemento(unElemento);
	end;
	
	function ABB.cantidadDeElementos(): integer;
	begin
		if not estoyVacio then
			cantidadDeElementos := raiz.contar()
		else
			cantidadDeElementos:= 0;
	end;
	
	procedure ABB.imprimir();
	begin
	if not estoyVacio then
		raiz.imprimir();
	end;
	
	procedure ABB.imprimirInverso();
	begin
	if not estoyVacio then
		raiz.imprimirInverso();
	end;
	
	procedure ABB.imprimirPreOrden();
	begin
	if not estoyVacio then
		raiz.imprimirPreOrden();
	end;
	
	procedure ABB.imprimirPostOrden();
	begin
	if not estoyVacio then
		raiz.imprimirPostOrden();
	end;
	
	function ABB.minimo(): integer;
	begin
		if not estoyVacio then
			minimo:= raiz.minimo
		else
			minimo:= low(integer);
	end;
	
	function ABB.maximo(): integer;
	begin
		if not estoyVacio then
			maximo:= raiz.maximo
		else
			maximo:= high(integer);
	end;
	
	procedure  ABB.imprimirMenores(unValor: integer);
	begin
		if not estoyVacio then
			raiz.imprimirMenores(unValor);
	end;
	procedure  ABB.imprimirMayores(unValor: integer);
	begin
		if not estoyVacio then
			raiz.imprimirMayores(unValor);
	end;
	
	procedure ABB.imprimirAcotado(unValorMin, unValorMax: integer);
	begin
		if not estoyVacio then
			raiz.imprimirAcotado(unValorMin, unValorMax);
	end;
	
end.
