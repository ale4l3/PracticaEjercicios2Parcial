unit UABBGenerico;
{$mode objfpc}

interface

type

	Procedimiento = procedure(unDato: TObject);

	Comparable = class
	public
		function equals(otroComparable: Comparable): boolean;   reintroduce; virtual; abstract;
		function lessThan(otroComparable: Comparable): boolean;   virtual; abstract;
		function greaterThan(otroComparable: Comparable): boolean;    virtual; abstract;
		function lessThanOrEquals(otroComparable: Comparable): boolean;    virtual; abstract;
		function greaterThanOrEquals(otroComparable: Comparable): boolean;  virtual; abstract;
	end;
		
	ClaveDato = class
	private
		clave: Comparable;
		dato: TObject;
	public
		constructor create(unaClave: Comparable; unDato: TObject);
		function getClave(): Comparable;
		function getDato(): TObject;
		function toString(): ansistring; override;
	end;
	
	Nodo = class
		private
			elemento: ClaveDato;
			hijoizq, hijoder: Nodo;
			hayhijoizq, hayhijoder: boolean;
				
		public
			constructor create(unaClave: Comparable; unDato: TObject);
				
			procedure agregar(n: Nodo); virtual;
			function toString(): ansistring; override;
				
			function getClave(): Comparable;
			function getDato(): TObject;
			
			function getMinimo(): TObject;
			function getMaximo(): TObject;
				
			function contar(): integer;
				
			function existeElemento(unaClave: Comparable): boolean;
			function buscarElemento(unaClave: Comparable): TObject;
			function devolverElemento(): TObject; virtual;
				
			function tenesHijoIzq(): boolean;
			function tenesHijoDer(): boolean;
			function getHijoIzq(): Nodo;
			function getHijoDer(): Nodo;
			
			procedure imprimirEnOrden();
			procedure imprimirEnOrdenInverso();
			procedure imprimirPreOrden();
			procedure imprimirPostOrden();
				
			procedure imprimirMayores(unaClave: Comparable);
			procedure imprimirMenores(unaClave: Comparable);
				
			procedure imprimirAcotado(min, max: Comparable);
				
			procedure hacerAlgo(min, max: Comparable; queHacer: Procedimiento);
			procedure procesar(queHacer: Procedimiento); virtual; 
		end;	
	
	ABBGenerico = class			
		private
			raiz: Nodo;
			vacio: boolean;
			
		protected
			procedure agregarNodo(unNodo: Nodo);
			
		public
			constructor create();
			
			procedure agregar(unaClave: Comparable; unDato: TObject);	virtual;	
			procedure agregar(unElemento: Comparable); virtual;
				
			function existeElemento(unaClave: Comparable): boolean;
			procedure buscarElemento(unaClave: Comparable; var dato: TObject; var existe: boolean);
			function cantidadDeElementos(): integer;
			function estasVacio(): boolean;
			function getMinimo(): TObject;
			function getMaximo(): TObject;
			
			procedure imprimirEnOrden();
			procedure imprimirEnOrdenInverso();
			procedure imprimirPreOrden();
			procedure imprimirPostOrden();
			procedure imprimirMayores(unaClave: Comparable);
			procedure imprimirMenores(unaClave: Comparable);

			procedure imprimirAcotado(min, max: Comparable);
			
			procedure procesar(min, max: Comparable; queHacer: Procedimiento); 
	end;
	
implementation

	constructor ClaveDato.create(unaClave: Comparable; unDato: TObject);
	begin
	clave:= unaClave;
	dato:= unDato;
	end;

	function ClaveDato.getClave(): Comparable;
	begin
	getClave:= clave;
	end;

	function ClaveDato.getDato(): TObject;
	begin
	getDato:= dato;
	end;

	function ClaveDato.toString(): ansistring; 
	begin
	if dato = nil then
		toString:= clave.toString()
	else
		toString:= dato.toString();
	end;

////////////////////////////////////////////////////////////////////////

	constructor Nodo.create(unaClave: Comparable; unDato: TObject);
	begin
	elemento:= ClaveDato.create(unaClave, unDato);
	hayhijoizq:= false;
	hayhijoder:= false;
	end;
	
	procedure Nodo.agregar(n: Nodo);
	begin
	if n.getClave().lessThan(elemento.getClave())  then
		begin
		if hayhijoizq then
			hijoizq.agregar(n)
		else
			begin
			hijoizq:= n;
			hayhijoizq:= true;
			end;
		end
	else
		begin
		if hayhijoder then
			hijoder.agregar(n)
		else
			begin
			hijoder:= n;
			hayhijoder:= true;
			end;
		end
	end;
	
	function Nodo.toString(): ansistring;
	begin
	toString:= elemento.toString();
	end;
	
	function Nodo.getClave(): Comparable;
	begin
	getClave:= elemento.getClave();
	end;
	
	function Nodo.getDato(): TObject;
	begin
	getDato:= elemento.getDato();
	end;
	
	function Nodo.getMinimo(): TObject;
	begin
	if hayhijoizq then
		getMinimo:= hijoIzq.getMinimo()
	else
		if elemento.getDato = nil then
			getMinimo:= elemento.getClave()
		else
			getMinimo:= elemento;
	end;
			
	function Nodo.getMaximo(): TObject;
	begin
	if hayhijoder then
		getMaximo:= hijoDer.getMaximo()
	else
		if elemento.getDato = nil then
			getMaximo:= elemento.getClave()
		else
			getMaximo:= elemento;
	end;
	
	function Nodo.contar(): integer;
	begin
	contar:= 0;
	if hayhijoizq then
		contar:= contar + hijoIzq.contar();
	if hayhijoder then
		contar:= contar + hijoDer.contar();
	contar:= contar + 1;
	end;
	
	function Nodo.existeElemento(unaClave: Comparable): boolean;
	begin	
	if elemento.getClave.equals(unaClave) then
		existeElemento:= true
	else
	if unaClave.lessThan(elemento.getClave()) then
		begin
		if hayhijoizq then
			existeElemento:= hijoizq.existeElemento(unaClave)
		else
			existeElemento:= false
		end
	else
		begin
		if hayhijoder then
			existeElemento:= hijoder.existeElemento(unaClave)
		else
			existeElemento:= false
		end;
	end;
	
	function Nodo.devolverElemento(): TObject;
	begin
	if elemento.getDato() = nil then
		devolverElemento:= elemento.getClave()
	else
		devolverElemento:= elemento.getDato();
	end;
	
	function Nodo.buscarElemento(unaClave: Comparable): TObject;
	begin	
	if elemento.getClave().equals(unaClave) then
		buscarElemento:= self.devolverElemento()
	else
	if unaClave.lessThan(elemento.getClave()) then
		begin
		if hayhijoizq then
			buscarElemento:= hijoizq.buscarElemento(unaClave)
		else
			buscarElemento:= nil
		end
	else
		begin
		if hayhijoder then
			buscarElemento:= hijoder.buscarElemento(unaClave)
		else
			buscarElemento:= nil
		end;
	end;
	
	function Nodo.tenesHijoIzq(): boolean;
	begin
	tenesHijoIzq:= hayhijoizq;
	end;
				
	function Nodo.tenesHijoDer(): boolean;
	begin
	tenesHijoDer:= hayhijoder;
	end;
	
	function Nodo.getHijoIzq(): Nodo;
	begin
	getHijoIzq:= hijoizq;
	end;
	
	function Nodo.getHijoDer(): Nodo;
	begin
	getHijoDer:= hijoder;
	end;
	
	procedure Nodo.imprimirEnOrden();
	begin
	if self.tenesHijoIzq() then
		self.getHijoIzq.imprimirEnOrden();
	
	writeln(self.toString());
	
	if self.tenesHijoDer() then
		self.getHijoDer.imprimirEnOrden();
	end;
	
	procedure Nodo.imprimirEnOrdenInverso();
	begin
	if self.tenesHijoDer() then
		self.getHijoDer.imprimirEnOrdenInverso();
	
	writeln(self.toString());
	
	if self.tenesHijoIzq() then
		self.getHijoIzq.imprimirEnOrdenInverso();
	end;
			
	procedure Nodo.imprimirPreOrden();
	begin
	writeln(self.toString());
	
	if self.tenesHijoIzq() then
		self.getHijoIzq.imprimirPreOrden();
	
	if self.tenesHijoDer() then
		self.getHijoDer.imprimirPreOrden();
	end;
	
	procedure Nodo.imprimirPostOrden();
	begin	
	if self.tenesHijoIzq() then
		self.getHijoIzq.imprimirPostOrden();
	
	if self.tenesHijoDer() then
		self.getHijoDer.imprimirPostOrden();
		
	writeln(self.toString());
	end;
	
	procedure Nodo.procesar(queHacer: Procedimiento); 
	begin
	if elemento.getDato() = nil then
		queHacer(elemento.getClave())
	else
		queHacer(elemento.getDato());
	end;
	
	procedure Nodo.hacerAlgo(min, max: Comparable; queHacer: Procedimiento);
	begin
	if elemento.getClave().greaterThanOrEquals(min) and elemento.getClave().lessThanOrEquals(max) then
		begin
		if self.tenesHijoIzq() then
			self.getHijoIzq.hacerAlgo(min, max, queHacer);
			
		self.procesar(queHacer);
		
		if self.tenesHijoDer() then
			self.getHijoDer.hacerAlgo(min, max, queHacer);
		end
	else
	if elemento.getClave().lessThan(min) then
		begin
		if self.tenesHijoDer() then
			self.getHijoDer.hacerAlgo(min, max, queHacer);
		end
	else
		begin
		if self.tenesHijoIzq() then
			self.getHijoIzq.hacerAlgo(min, max, queHacer);
		end;
	end;	
	
	procedure Nodo.imprimirAcotado(min, max: Comparable);
	begin
	if (elemento.getClave().greaterThanOrEquals(min)) and (elemento.getClave().LessThanOrEquals(max)) then
		begin
		if self.tenesHijoIzq() then
			self.getHijoIzq.imprimirAcotado(min, max);
			
		writeln(self.toString());
		
		if self.tenesHijoDer() then
			self.getHijoDer.imprimirAcotado(min, max);
		end
	else
	if elemento.getClave().lessThan( min) then
		begin
		if self.tenesHijoDer() then
			self.getHijoDer.imprimirAcotado(min, max);
		end
	else
		begin
		if self.tenesHijoIzq() then
			self.getHijoIzq.imprimirAcotado(min, max);
		end;
	end;
	
	procedure Nodo.imprimirMayores(unaClave: Comparable);
	begin
	if (elemento.getClave().greaterThanOrEquals(unaClave)) then
		begin
		if self.tenesHijoIzq() then
			hijoIzq.imprimirMayores(unaClave);
		writeln(self.toString());
		if self.tenesHijoDer() then
			hijoDer.imprimirMayores(unaClave);	
		end
	else
		if self.tenesHijoDer() then
			hijoDer.imprimirMayores(unaClave);
	end;
			
	procedure Nodo.imprimirMenores(unaClave: Comparable);
	begin
	if (elemento.getClave().lessThanOrEquals(unaClave)) then
		begin
		if self.tenesHijoIzq() then
			hijoIzq.imprimirMenores(unaClave);
		writeln(self.toString());
		if self.tenesHijoDer() then
			hijoDer.imprimirMenores(unaClave);
		end
	else
		if self.tenesHijoIzq() then
			hijoIzq.imprimirMenores(unaClave);
	end;

	////////////////////////////////////////////////////////////////////
	
    constructor ABBGenerico.create();
    begin
    vacio:= true;
    end;
    
    procedure ABBGenerico.agregarNodo(unNodo: Nodo);
    begin
    if vacio then
		begin
		raiz:= unNodo;
		vacio:= false;
		end
	else
		raiz.agregar(unNodo);
    end;
    
    procedure ABBGenerico.agregar(unaClave: Comparable; unDato: TObject);
    var n: Nodo;
    begin
    n:= Nodo.create(unaClave, unDato);
    self.agregarNodo(n);
    end;
    
    procedure ABBGenerico.agregar(unElemento: Comparable);
    var n: Nodo;
    begin
    n:= Nodo.create(unElemento, nil);
    self.agregarNodo(n);
    end;
    
    function ABBGenerico.existeElemento(unaClave: Comparable): boolean;
    begin
    if vacio then
		existeElemento:= false
	else
		existeElemento:= raiz.existeElemento(unaClave);
    end;
			
	procedure ABBGenerico.buscarElemento(unaClave: Comparable; var dato: TObject; var existe: boolean);
	begin
	if vacio then
		existe:= false
	else
		begin
		dato:= raiz.buscarElemento(unaClave);
		existe:= dato <> nil;
		end;
	end;
	
	function ABBGenerico.cantidadDeElementos(): integer;
	begin
	if not vacio then
		cantidadDeElementos:= raiz.contar()
	else
		cantidadDeElementos:= 0;
	end;
	
	function ABBGenerico.estasVacio(): boolean;
	begin
	estasVacio:= vacio;
	end;
	
	function ABBGenerico.getMinimo(): TObject;
	begin
	if not vacio then
		getMinimo:= raiz.getMinimo()
	else
		getMinimo:= nil;
	end;
	
	function ABBGenerico.getMaximo(): TObject;
	begin
	if not vacio then
		getMaximo:= raiz.getMaximo()
	else
		getMaximo:= nil;
	end;

	procedure ABBGenerico.imprimirEnOrden();
	begin
	if not vacio then
		raiz.imprimirEnOrden();
	end;
	
	procedure ABBGenerico.imprimirEnOrdenInverso();
	begin
	if not vacio then
		raiz.imprimirEnOrdenInverso();
	end;
			
	procedure ABBGenerico.imprimirPreOrden();
	begin
	if not vacio then
		raiz.imprimirPreOrden();
	end;
	
	procedure ABBGenerico.imprimirPostOrden();
	begin
	if not vacio then
		raiz.imprimirPostOrden();
	end;
	
	procedure ABBGenerico.imprimirAcotado(min, max: Comparable);
	begin
	if not vacio then
		raiz.imprimirAcotado(min, max);
	end;
	
	procedure ABBGenerico.imprimirMayores(unaClave: Comparable);
	begin
	if not vacio then
		raiz.imprimirMayores(unaClave);
	end;
	
	procedure ABBGenerico.imprimirMenores(unaClave: Comparable);
	begin
	if not vacio then
		raiz.imprimirMenores(unaClave);
	end;
	
	procedure ABBGenerico.procesar(min, max: Comparable; queHacer: Procedimiento);
	begin
	if not vacio then
		raiz.hacerAlgo(min, max, queHacer);
	end;
	
end.
