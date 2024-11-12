{Ejercicio 4. Una empresa mayorista almacena la información de todos los productos que
vende. De cada producto se conoce: su ID (formado por código de rubro y código de unidad,
ambos números enteros), precio del producto y stock actual.
1) Haga un módulo que genere 45 productos generados al azar y sin orden alguno.
Almacene los alquileres en un ABB ordenado por ID.
2) Haga un módulo que reciba el ABB generado y permita aumentar el precio un 15 %.
3) Haga un módulo que reciba el ABB generado e imprima toda la información de los
productos cuyo rubro es “indumentaria”.
4) Haga un módulo que reciba el ABB generado, un ID de producto y una cantidad
vendida y actualice el stock de dicho producto. 
5) Haga un módulo que reciba el ABB generado e imprima aquellos productos con un
stock menor a 10 unidades. HECHO
6) Haga un módulo que reciba el ABB generado y dos ID de producto e imprima el stock
actual de todos los productos que se encuentran entre los dos ID.
7) Escriba un programa que invoque a los seis módulos implementados y compruebe el
correcto funcionamiento del mismo.}
//AClaraciones voy hacer 3 rubros, alimentos, indumentaria y electronicos (1,2,3)

program ejercicio4	;
{$mode objfpc}
uses SysUtils, UABBGenerico, UDateTime, URandomGenerator, GenericLinkedList, UEntero;
const 
	ProductosAGenerar = 45;
type
//CLASES INTERFACE
	ID = class (Comparable)
		private
			codRubro,codUnidad:integer;
		public
			constructor create(unRubro,unaUnidad:integer);
			function getCodRubro():integer;
			function getCodUnidad():integer;
			function equals (otroComparable : comparable) : boolean; override; 
			function lessThan ( otroComparable : comparable) : boolean; override; 
			function greaterThan ( otroComparable : comparable) : boolean; override; 
			function lessThanOrEquals ( otroComparable : comparable) : boolean; override; 
			function greaterThanOrEquals ( otroComparable : comparable) : boolean; override; 		
	end;
	
	Producto = class
		private
			nID:ID;
			precio:real;
			stock:integer;
		public
			constructor create(unaID:ID;unPrecio:real;unStock:integer);

			function	getID():ID;
			function getPrecio:real;
			function getStock:integer;
			procedure setPrecio(unPrecio:real);
			procedure setStock(unStock:integer);
			function toString:ansistring; override;
	end;
	
	NodoProducto = class (Nodo)
		public
			procedure imprimirIndumentaria(min, max: Comparable; queHacer: Procedimiento;unCodigo:integer);
	end;
	
	ABBProductos = class (ABBGenerico)
		public
			procedure agregar(unaClave: Comparable; unDato: TObject); override;
			procedure imprimirIndumentaria(min, max: Comparable; queHacer: Procedimiento;unCodigo:integer);

	end;
	
//CLASES IMPLEMENTACION
//CLASE ID
	constructor ID.create(unRubro,unaUnidad:integer);
	begin
		codRubro:=unRubro;
		codUnidad:=unaUnidad;
	end;
	function ID.getCodRubro():integer;
	begin
		getCodRubro:=codRubro;
	end;
	function ID.getCodUnidad():integer;
	begin
		getCodUnidad:=codUnidad;
	end;
	function ID.equals (otroComparable : comparable) : boolean;
	begin
		equals := ( codRubro = (otroComparable as ID).getCodRubro() ) and ( codUnidad = (otroComparable as ID).getCodUnidad() )
	end;

	function ID.lessThan (otroComparable : comparable) : boolean; 
	begin 
		lessThan :=  ( codRubro < (otroComparable as ID).getCodRubro() )
		or (  ( codRubro = (otroComparable as ID).getCodRubro() ) and (codUnidad  <  (otroComparable as ID).getCodUnidad()) ) 
	end;
	
	function ID.greaterThan (otroComparable : comparable) : boolean; 
	begin 
		greaterThan :=  ( codRubro > (otroComparable as ID).getCodRubro() )
		or (  ( codRubro = (otroComparable as ID).getCodRubro() ) and (codUnidad  >  (otroComparable as ID).getCodUnidad()) ) 
	end;
	
	function ID.lessThanOrEquals (otroComparable : comparable) : boolean; 
	begin 
		lessThanOrEquals :=  ( codRubro < (otroComparable as ID).getCodRubro() )
		or (  ( codRubro = (otroComparable as ID).getCodRubro() ) and (codUnidad  <=  (otroComparable as ID).getCodUnidad()) ) 
	end;
	
	function ID.greaterThanOrEquals (otroComparable : comparable) : boolean; 
	begin 
		greaterThanOrEquals :=  ( codRubro > (otroComparable as ID).getCodRubro() )
		or (  ( codRubro = (otroComparable as ID).getCodRubro() ) and (codUnidad  >=  (otroComparable as ID).getCodUnidad()) ) 
	end;
	
//Clase Producto

		constructor Producto.create(unaID:ID;unPrecio:real;unStock:integer);
		begin
			nID:=unaID;
			precio:=unPrecio;
			stock:=unStock;
		end;
		function	Producto.getID():ID;
		begin
			getID:=nID;
		end;
		function Producto.getPrecio:real;
		begin
			getPrecio:=precio;
		end;
		function Producto.getStock:integer;
		begin
			getStock:=stock;
		end;
		procedure Producto.setPrecio(unPrecio:real);
		begin
			precio:=unPrecio;
		end;
		procedure Producto.setStock(unStock:integer);
		begin
			stock:=unStock;
		end;
		function Producto.toString:ansistring;
		begin
			toString:= 'ID del producto: '  + IntToStr(self.getID.getCodRubro) + '. ' + IntToStr(self.getID.getCodUnidad) +
							 '. Precio por unidad: ' + FormatFloat('0.00', self.getPrecio) +
							 '. Stock: ' +  IntToStr(self.getStock);
		end;
		
//NodoProducto

		procedure NodoProducto.imprimirIndumentaria(min, max: Comparable; queHacer: Procedimiento;unCodigo:integer);
		begin
			if NodoProducto(self).getClave().greaterThanOrEquals(min) and NodoProducto(self).getClave().lessThanOrEquals(max) then
				begin
				if self.tenesHijoIzq() then
					NodoProducto(getHijoIzq()).imprimirIndumentaria(min, max, queHacer,unCodigo);
				
				if (unCodigo = ID(self.getClave()).getCodRubro()) then
					self.procesar(queHacer);
				
				if self.tenesHijoDer() then
					NodoProducto(getHijoDer()).imprimirIndumentaria(min, max, queHacer,unCodigo);
				end
			else
			if NodoProducto(self).getClave().lessThan(min) then
				begin
				if self.tenesHijoDer() then
					NodoProducto(getHijoDer()).imprimirIndumentaria(min, max, queHacer,unCodigo);
				end
			else
				begin
				if self.tenesHijoIzq() then
					 NodoProducto(getHijoIzq()).imprimirIndumentaria(min, max, queHacer,unCodigo);
				end;
		end;	


//ABBProductos

	procedure	ABBProductos.agregar(unaClave: Comparable; unDato: TObject);
	var
		n:NodoProducto;
	begin
		n:=NodoProducto.create(unaClave,unDato);
		self.agregarNodo(n);
	end;		
		
	procedure ABBProductos.imprimirIndumentaria(min, max: Comparable; queHacer: Procedimiento;unCodigo:integer);
	begin
		if not self.estasVacio then
			NodoProducto(raiz).imprimirIndumentaria(min, max, queHacer, unCodigo);
	end;
	
//PROCEDIMIENTOS PROGRAMA PRINCIPAL

function crearProducto(rg:RandomGenerator; unaID:ID):Producto;
	begin
		rg:=RandomGenerator.create();
		crearProducto:= Producto.create(unaID,rg.getReal(1,50),rg.getInteger(1,100));
	end;

// PROCEDIMIENTOS @
procedure imprimirIndumentaria(unObjeto:TObject);
	var
		p:producto;
	begin
		p:= unObjeto as Producto;
		writeln(p.toString);
	end;

procedure aumentarElPrecio15Porciento(unObjeto:TObject);
	var
		p:producto;
	begin
		if unObjeto is Producto then begin
			p:= unObjeto as Producto;
			p.setPrecio(p.getPrecio*1.15);
		end
		else
			writeln('Se cree un nodo vacio ver porque');
	end;
	
procedure stockMenor10(unObjeto:TObject);
	var
		p:producto;
	begin
		p:= unObjeto as Producto;
		if p.getStock() < 10 then
			writeln(p.toString);
	end;
	
//MODULOS

procedure cargarArbolProductos (a:ABBProductos);
	var
		rg:RandomGenerator;
		unaID:ID;
		i:integer;
	begin
		rg:=RandomGenerator.create();
		for i:=1 to ProductosAGenerar do begin
			unaID:= ID.create(rg.getInteger(1,3),rg.getInteger(1,1000));
			a.agregar(unaID,crearProducto(rg,unaID));
		end;
	end;
	
	procedure moduloAumentarPrecio15 (a:ABBProductos);
	begin
			a.procesar(ID.create(0,0), ID.create(4,99), @aumentarElPrecio15Porciento);
	end;
	
	procedure moduloImprimirIndumentaria(a:ABBProductos);
		begin
			writeln('Se va imprimir solo las unidades del rubro Indumentaria');
			a.imprimirIndumentaria(ID.create(0,0), ID.create(4,99), @imprimirIndumentaria, 2);
		end;
		
	procedure moduloActualizarStock (a:ABBProductos; unaID:ID;unaCantidadVendida:integer);
	var
		p:Producto;
		obj:TObject;
		existe:boolean;
	begin
		a.buscarElemento(unaID,obj,existe);
		if existe then begin	
			p:= obj as Producto;
			if p.getStock > unaCantidadVendida then
				p.setStock(p.getStock - unaCantidadVendida)
			else
				p.setStock(0);
		end;
	end;	
		
	procedure	moduloStockMenor10(a:ABBProductos);
		begin
			a.procesar(ID.create(0,0), ID.create(4,99), @stockMenor10);
		end;

	procedure moduloImprimirAcotado(a:ABBProductos; rubro,rubro2,unidad,unidad2:integer);
		begin
			a.imprimirAcotado(ID.create(rubro,unidad), ID.create(rubro2,unidad2));
		end;

//PROGRAMA PRINCIPAL
var
a:ABBProductos;
rubro,rubro1,rubro2,unidad,unidad1,unidad2,unaCantidad:integer;
BEGIN
	a:= ABBProductos.create();
	cargarArbolProductos(a);
	a.imprimirEnOrden;
	moduloAumentarPrecio15(a);
	moduloImprimirIndumentaria(a);
	writeln('|| Seleccionar unidad vendida || ');
	writeln('Ingresar codigo rubro (Alimentos (1), Indumenta (2), Electronicos (3) '); readln(rubro);
	writeln('Ingresar codigo unidad: '); readln(unidad);
	writeln('Ingresar cantidad vendida: '); readln(unaCantidad);
	moduloActualizarStock(a,ID.create(rubro,unidad),unaCantidad);
	moduloStockMenor10(a);
	writeln('Imprimir Acotado ');
	writeln('ID Minimo');
	writeln('Ingresar codigo rubro (Alimentos (1), Indumenta (2), Electronicos (3): '); readln(rubro1);
	writeln('Ingresar codigo Unidad:  '); readln(unidad1);
	writeln('ID Maxima');
	writeln('Ingresar codigo rubro (Alimentos (1), Indumenta (2), Electronicos (3): '); readln(rubro2);
	writeln('Ingresar codigo Unidad: '); readln(unidad2);
	moduloImprimirAcotado(a,rubro1,rubro2,unidad1,unidad2);
	
END.

