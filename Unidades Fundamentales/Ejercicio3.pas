{Ejercicio 3. Una empresa de envío de encomiendas desea mantener el historial de envíos
realizados. La empresa posee distintos puntos de retiro identificados por (Provincia-Localidad).
Se desea almacenar para cada punto de retiro las encomiendas recepcionadas y las
despachadas. De cada encomienda se conoce: remitente, peso, dirección de destino y fecha de
recepción/despacho.
1) Haga un módulo que simule 60 despachos/recepciones en total repartidas en 15
puntos de retiro. Las encomiendas (generadas al azar) no tienen orden alguno.
Almacene las encomiendas en un ABB ordenado por punto de retiro. Para cada punto
de retiro almacene todas sus encomiendas discriminadas en “despachadas” y
“recepcionadas”. Las “despachadas” deben almacenarse ordenada por peso, mientras
que las “recepcionadas” deben almacenarse ordenada por dirección destino.
2) Haga un módulo que reciba el ABB previamente generado e imprima para todos los
punto de retiro de Formosa, las encomiendas despachadas menores a 50 KG.
3) Haga un módulo que reciba el ABB previamente generado y un identificador de punto
de retiro, recupere todas sus encomiendas y almacénelas en otro ABB ordenado por
fecha.
4) Haga un módulo que reciba el ABB con las encomiendas de un punto de retiro (el
creado en el inciso anterior) e imprima toda la información de las encomiendas entre
dos fechas recibidas.
5) Escriba un programa que invoque a los cuatro módulos implementados y compruebe el
correcto funcionamiento del mismo.

Clase Encomienda
Clave : PuntoDeRetiro String Provincia-Localidad (usar UCadena)
Formosa
   Cada nodo tiene la id del punto retiro
   y 2 elementos 2
}


program Ejercicio3;
{$mode objfpc}
uses SysUtils, UABBGenerico, UDateTimeComparable, URandomGenerator, GenericLinkedList, UEntero, UCadena;
const cantSimular = 60;
type
//CLASES INTERFACE
	Encomienda = class
	private
		remitente:string;
		peso:real;
		destino:string;
		fecha:Date;
		despachada:boolean;
	public
		constructor create(unRemitente, unDestino:string; unPeso:real; unaFecha:Date);

		function getRemitente():string;
		function getPeso():real;
		function getDestino():string;
		function getFecha():Date;
		function getDespachada():boolean;
		function toString():ansistring;
	end;
	
	ID = class (Comparable);
		private
			provincia:string;
			localidad:string;
		public
			constructor create(unaProvincia,unaLocalidad:string);
			function getProvincia():string;
			function getLocalidad():string;
			function equals (otroComparable : comparable) : boolean; override; 
			function lessThan ( otroComparable : comparable) : boolean; override; 
			function greaterThan ( otroComparable : comparable) : boolean; override; 
			function lessThanOrEquals ( otroComparable : comparable) : boolean; override; 
			function greaterThanOrEquals ( otroComparable : comparable) : boolean; override; 		
		
	//LISTAS
	listaEncomiendas:= specialize LinkedList <Encomienda>;
	vListasEncomienda:= array [boolean] of listaEncomiendas;

	NodoPunto = class (Nodo)
		private
			encomiendas:vListasEncomienda;
		public
			constructor create(unaClave: Comparable; unDato: TObject); 
			{procedure ImprimirTodo();}
			procedure agregar(unNodo: Nodo); override
			procedure imprimirFormosa50kg();
		end;
		
		ABBPuntos = class (ABBGenerico)
			public
				procedure	agregar(unaClave: Comparable; unDato: TObject); override;
				{procedure ImprimirTodo();}
				procedure imprimirFormosa50kg();
		end;
//CLASES IMPLEMENTACION

//CLASE ID
	constructor ID.create(unaProvincia,unaLocalidad:string;
	begin
		provincia:=unaProvincia;
		localidad:=unaLocalidad;
	end;
	function ID.getProvincia():string;
	begin
		getProvincia:=provincia;
	end;
	function ID.getLocalidad():string;
	begin
		getLocalidad:=localidad;
	end;
	function ID.equals (otroComparable : comparable) : boolean;
	begin
		equals := ( provincia = (otroComparable as ID).getProvincia() ) and ( localidad = (otroComparable as ID).getLocalidad() )
	end;

	function ID.lessThan (otroComparable : comparable) : boolean; 
	begin 
		lessThan :=  ( provincia < (otroComparable as ID).getProvincia() )
		or (  ( provincia = (otroComparable as ID).getProvincia() ) and (localidad  <  (otroComparable as ID).getLocalidad()) ) 
	end;
	
	function ID.greaterThan (otroComparable : comparable) : boolean; 
	begin 
		greaterThan :=  ( provincia > (otroComparable as ID).getProvincia() )
		or (  ( provincia = (otroComparable as ID).getProvincia() ) and (localidad  >  (otroComparable as ID).getLocalidad()) ) 
	end;
	
	function ID.lessThanOrEquals (otroComparable : comparable) : boolean; 
	begin 
		lessThanOrEquals :=  ( provincia < (otroComparable as ID).getProvincia() )
		or (  ( provincia = (otroComparable as ID).getProvincia() ) and (localidad  <=  (otroComparable as ID).getLocalidad()) ) 
	end;
	
	function ID.greaterThanOrEquals (otroComparable : comparable) : boolean; 
	begin 
		greaterThanOrEquals :=  ( provincia > (otroComparable as ID).getProvincia() )
		or (  ( provincia = (otroComparable as ID).getProvincia() ) and (localidad  >=  (otroComparable as ID).getLocalidad()) ) 
	end;
//CLASE Encomienda
		constructor Encomienda.create(unRemitente, unDestino:string; unPeso:real; unaFecha:Date;es:boolean);
		begin
			remitente:=unRemitente;
			peso:=unPeso
			destino:=unDestino;
			despachada:=es;
			fecha:=unaFecha;
		end;
		function Encomienda.getRemitente():string;
		begin
			getRemitente:=remitente;
		end;
		function Encomienda.getPeso():real;
		begin
			getPeso:=peso;
		end;
		function Encomienda.getDestino():string;		
		begin
			getDestino:=destino;
		end;
		function Encomienda.getFecha():Date;.
		begin
			getFecha:=fecha;
		end;
		function Encomienda.getDespachada():boolean;
		begin
				getDespachada:=despachada;
		end;
		function Encomienda.toString():ansistring;
		begin
				toString:= 'Remitente: ' + self.getRemitente + ' .Peso: ' + FormatFloat('0.00', self.getPeso) +
								 'Destino: ' + self.getDestino + ' .Fecha: ' + FloatToStr(self.getFecha.getDay) + '/' + FloatToStr(self.getFecha.getMonth) + '/' + FloatToStr(self.getFecha.getYear);
		end;
		
//CLASE NODOPUNTO
	constructor NodoPunto.create(unaClave: Comparable; unDato: TObject);
	var
	e:Encomienda;
	begin
		inherited create(unaClave,unDato);
		encomiendas[true]:= ListaEncomiendas.create;
		encomiendas[false]:= ListaEncomiendas.create;
		e:=unDato as Encomienda;
		if e.despachada then
			encomiendas[e.despachada].add(e)
		else
			encomiendas[e.despachada].add(e);
		end;
		{if e.despachada then 
			begin
				NodoPunto(self).encomiendas[e.despachada].reset();
				while (not encomiendas[e.despachada].eol) and ( Encomienda(unDato).getPeso() < encomiendas[e.despachada].current().getPeso() )  do
					self.encomiendas[e.despachada].next();
				encomiendas[e.despachada].insertCurrent(e);
		end
		else
			begin
				while (not encomiendas[e.despachada].eol) and ( e.getDestino() < encomiendas[e.despachada].current().getDestino() ) do
					encomiendas[e.despachada].next();
				encomiendas[e.despachada].insertCurrent(e);
			end;}
			
		procedure NodoPunto.agregar(unNodo: Nodo);
			var
			e:Encomienda;
			begin
				e:=unNodo.getDato as Encomienda;
				if unNodo.getClave().equals(self.getClave()) then
					if e.despachada then
					begin
						encomiendas[e.despachada].reset();
						while (not encomiendas[e.despachada].eol) and ( Encomienda(unDato).getPeso() < encomiendas[e.despachada].current().getPeso() )  do
							self.encomiendas[e.despachada].next();
						encomiendas[e.despachada].insertCurrent(e);
					end
					else
					begin
						while (not encomiendas[e.despachada].eol) and ( e.getDestino() < encomiendas[e.despachada].current().getDestino() ) do
							encomiendas[e.despachada].next();
						encomiendas[e.despachada].insertCurrent(e);
					end;
				else
					inherited agregar(unNodo);
		end;
	
	procedure NodoPunto.imprimirFormosa50kg();
	begin
		if self.tenesHijoIzq() then
			self.getHijoIzq.imprimirFormosa50kg();
			
		if ( Nodo(self).getClave.getLocalidad = 'Formosa' ) then
			if  not encomiendas[true].eol then
			begin
				encomiendas[true].reset();
				while not encomiendas[true].eol do
						writeln( encomiendas[true].current().toString() );
			end
			else
				writeln('La lista de despachos esta vacia');
				
		if self.tenesHijoDer() then
			self.getHijoDer.imprimirFormosa50kg();
	end;
	
//ABBPunto CLASE

    procedure ABBPuntos.agregar(unaClave: Comparable; unDato: TObject);
	var
		n:NodoPunto;
	begin
		n:=NodoPunto.create(unaClave,unDato);
		self.agregarNodo(n);
	end;
	
	procedure ABBPuntos.imprimirFormosa50kg();
	begin
		if not self.estasVacio then
			NodoProducto(raiz).imprimirIndumentaria(min, max, queHacer, unCodigo);
	end;
	
//PROCEDIMIENTOS PROGRAMA PRINCIPAL
function crearID(rgProvincia,rgLocalidadF,rgLocalidadB,rgLocalidadS, rgLocalidadC, rgLocalidadCABA):ID;
var
provincia,localidad:string;
begin
	provincia:= rgProvincia.getLabel;
	if (provincia = 'Buenos Aires') then
		localidad:= rgLocalidadB.getLabel
	else
		if (provincia = 'Formosa') then
			localidad:= rgLocalidadF.getLabel
		else
			if (provincia = 'CABA')
				localidad:= rgLocalidadCABA.getLabel
			else
				if (provincia = 'Cordoba')
					localidad:= rgLocalidadC.getLabel
				else
					localidad:= rgLocalidadS.getLabel;
			
	crearID:=ID.create(provincia,localidad);
			
end; 

function crearEncomienda(rgProvincia,rgRemitente:RandomGenerator);
begin
	crearEncomienda := create(rgRemitente.getLabel, rgProvincia.getLabel; rgRemitente.getReal; Date.create(rgRemitente.getInteger(1,30),rgRemitente.getInteger(1,12), rgRemitente.getInteger(2023,2024), rgRemitente.getBoolean);
end;
//MODULOS
procedure moduloImprimirFormosa50kg(a:ABBPuntos);
begin
	a.imprimirFormosa50kg();
end;
procedure moduloSimularEncomiendas(a:ABBPuntos);
var
rgProvincia, rgLocalidadB, rgLocalidadF, rgLocalidadS, rgLocalidadC, rgLocalidadCABA, rgRemitente:RandomGenerator;
begin
	rgProvincia:=RandomGenerator.create();
	rgLocalidadB:=RandomGenerator.create();
	rgLocalidadF:=RandomGenerator.create();
	rgLocalidadS:=RandomGenerator.create();
	rgLocalidadC:=RandomGenerator.create();
	rgLocalidadCABA:=RandomGenerator.create();
	rgProvincia.addLabel('Formosa');
	rgProvincia.addLabel('Buenos Aires');
	rgProvincia.addLabel('CABA');
	rgProvincia.addLabel('Cordoba');
	rgProvincia.addLabel('Santa Fe');
	rgLocalidadB.addLabel('Quilmes');
	rgLocalidadB.addLabel('La Plata');
	rgLocalidadB.addLabel('Berazategui');
	rgLocalidadB.addLabel('Ensenada');
	rgLocalidadB.addLabel('Tigre');
	rgLocalidadF.addLabel('Formosa');
	rgLocalidadF.addLabel('Bermejo');
	rgLocalidadS.addLabel('Santa Fe');
	rgLocalidadS.addLabel('Rosario');
	rgLocalidadC.addLabel('Cordoba Capital');
	rgLocalidadC.addLabel('Rio Tercero');
	rgLocalidadC.addLabel('Rio Cuarto');
	rgLocalidadCABA.addLabel('Congreso');
	rgLocalidadCABA.addLabel('Belgrano');
	rgLocalidadCABA.addLabel('Palermo');
	rgLocalidadCABA.addLabel('San Telmo');
	rgLocalidadCABA.addLabel('Barracas');
	rgRemitente.addLabel('Pedro');
	rgRemitente.addLabel('Juana');
	rgRemitente.addLabel('Ana');
	rgRemitente.addLabel('Edgardo');
	rgRemitente.addLabel('Ignacio');
	rgRemitente.addLabel('Federico');
	rgRemitente.addLabel('Lara');
	for i:=1 to CantSimular do 
		a.agregar( crearID(rgProvincia,rgLocalidadF,rgLocalidadB,rgLocalidadS, rgLocalidadC, rgLocalidadCABA), crearEncomienda(rgProvincia, rgRemitente));
end;

procedure moduloCrearArbol(a:ABBPuntos; aG:ABBGenerico; unaID);
var
	obj:TObject;
	existe:boolean;
	vl:vListasEncomienda;
begin
	a.buscarElemento(unaID, obj, existe);
	if existe then
	begin
		vl:= obj as vListasEncomienda;
		vl[true].reset();
		vl[false].reset();
		while not vl[true].eol do
			ag.agregar(vl[true].current().getFecha,vl[true].current());
		while not vl[true].eol do
			ag.agregar(vl[false].current().getFecha,vl[false].current());
	end;
		
procedure 
end;
{
1) Haga un módulo que simule 60 despachos/recepciones en total repartidas en 15
puntos de retiro. Las encomiendas (generadas al azar) no tienen orden alguno.
Almacene las encomiendas en un ABB ordenado por punto de retiro. Para cada punto
de retiro almacene todas sus encomiendas discriminadas en “despachadas” y
“recepcionadas”. Las “despachadas” deben almacenarse ordenada por peso, mientras
que las “recepcionadas” deben almacenarse ordenada por dirección destino.
2) Haga un módulo que reciba el ABB previamente generado e imprima para todos los
punto de retiro de Formosa, las encomiendas despachadas menores a 50 KG.
3) Haga un módulo que reciba el ABB previamente generado y un identificador de punto
de retiro, recupere todas sus encomiendas y almacénelas en otro ABB ordenado por
fecha.
4) Haga un módulo que reciba el ABB con las encomiendas de un punto de retiro (el
creado en el inciso anterior) e imprima toda la información de las encomiendas entre
dos fechas recibidas.
//PROGRAMA PRINCIPAL
}
var i : byte;
a:ABBPuntos;
aG:ABBGenerico:
BEGIN
	a:= ABBPuntos.create();
	aG:= ABBGenerico.create();
	moduloSimularEncomiendas(a);
	{a.imprimirTodo;}
	moduloImprimirFormosa50kg(a);
	moduloCrearArbol(a,aG,unaID);
	
END.

