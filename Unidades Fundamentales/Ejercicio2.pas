{
Ejercicio 2. Una empresa de alquileres de autos almacena la información de todos los
alquileres realizados. De cada alquiler se conoce patente del vehículo, fecha de alquiler, marca
y modelo del auto, cantidad de días del alquiler y precio por día.
1) Haga un módulo que simule 30 alquileres para 3 marcas distintas. Los alquileres
(generados al azar) no tienen orden alguno. Almacene los alquileres en un ABB
ordenado por fecha de alquiler.
2) Haga un módulo que reciba el ABB generado e imprima todos los alquileres entre dos
fechas recibidas.
3) Haga un módulo que reciba el ABB generado e imprima solo los alquileres de los
vehículos con marca Fiat.
4) Haga un módulo que reciba el ABB generado e imprima solo los alquileres del vehículo
cuya patente es conocida.
5) Escriba un programa que invoque a los tres módulos implementados y compruebe el
correcto funcionamiento del mismo.
 
Clave: FechaAlquiler Clase Date (comparable)
Dato: Alquileres}
program Ejercicio2;
{$mode objfpc}
uses SysUtils, UABBGenerico, UDateTimeComparable, URandomGenerator, GenericLinkedList;
const AlquileresASimular = 30;
type
//INTERFACE CLASES 

	Alquiler = class
		private
			patente, cantDias, modelo: integer;
			fecha:Date;
			marca:string;
			precioDia:real;
		public
			constructor create(unaPatente, unaCantidadDias,unModelo:integer; unaFecha:Date; unaMarca:string; unPrecioDia:real);
			function getPatente():integer;
			function getCantDias():integer;
			function getFecha():Date;
			function getMarca():string;
			function getModelo():integer;
			function getPrecioDia():real;
			function toString(): ansistring; override;
		end;

	ABBAlquiler = class (ABBGenerico)

		public
			procedure	agregar(unaClave: Comparable; unDato: TObject); override;
			procedure procesarSoloUnaPatente(min, max: Comparable; queHacer: Procedimiento; unaPatente:integer); 
	end;

	NodoAlquiler = class (Nodo)
		public
			procedure procesarSoloUnaPatente(min, max: Comparable; queHacer: Procedimiento; unaPatente:integer); 
	end;

//Implementacion Clases
//ALQUILER
			constructor Alquiler.create(unaPatente, unaCantidadDias,unModelo:integer; unaFecha:Date; unaMarca:string; unPrecioDia:real);
			begin
				patente:= unaPatente;
				cantDias:= unaCantidadDias;
				modelo:= unModelo;
				fecha:=unaFecha;
				marca:=unaMarca;
				precioDia:=unPrecioDia;
			end;
			function Alquiler.getPatente():integer;
			begin
				getPatente:=patente;
			end;
			function Alquiler.getCantDias():integer;
			begin
				getCantDias:=cantDias;
			end;
			function Alquiler.getModelo():integer;
			begin
				getModelo:=modelo;
			end;
			function Alquiler.getFecha():Date;
			begin
				getFecha:= fecha;
			end;
			function Alquiler.getMarca():string;
			begin
				getMarca:=marca;
			end;
			function Alquiler.getPrecioDia():real;
			begin
				getPrecioDia:=precioDia;
			end;
			function Alquiler.toString(): ansistring; 
			begin
				toString := 'Patente: ' +  IntToStr(self.getPatente) + 
				  ', Marca: ' + self.getMarca + 
				  ', Modelo: ' + IntToStr(self.getModelo) + 
				  ', Dias en alquiler: ' + IntToStr(self.getCantDias) + 
				  ', Precio por dia: ' + FormatFloat('0.00', self.getPrecioDia) +
				  ', Fecha: ' + FloatToStr(self.getFecha.getDay) + '/' + FloatToStr(self.getFecha.getMonth) + '/' + FloatToStr(self.getFecha.getYear);
			end;

//Nodo Alquiler
	
	procedure NodoAlquiler.procesarSoloUnaPatente(min, max: Comparable; queHacer: Procedimiento; unaPatente:integer); 
	begin

	if NodoAlquiler(self).getClave().greaterThanOrEquals(min) and NodoAlquiler(self).getClave().lessThanOrEquals(max) then
		begin
		if self.tenesHijoIzq() then
			NodoAlquiler(getHijoIzq()).procesarSoloUnaPatente(min, max, queHacer, unaPatente);
		
		if (unaPatente = Alquiler(self.getDato()).getPatente())	then
			self.procesar(queHacer);
		
		if self.tenesHijoDer() then
			NodoAlquiler(getHijoDer()).procesarSoloUnaPatente(min, max, queHacer, unaPatente);
		end
	else
	if NodoAlquiler(self).getClave().lessThan(min) then
		begin
		if self.tenesHijoDer() then
			NodoAlquiler(getHijoDer()).procesarSoloUnaPatente(min, max, queHacer, unaPatente);
		end
	else
		begin
		if self.tenesHijoIzq() then
			 NodoAlquiler(getHijoIzq()).procesarSoloUnaPatente(min, max, queHacer, unaPatente);
		end;
	end;	
	
//ABBAlquiler
		
	procedure	ABBAlquiler.agregar(unaClave: Comparable; unDato: TObject);
	var
		n:NodoAlquiler;
	begin
		n:=NodoAlquiler.create(unaClave,unDato);
		self.agregarNodo(n);
	end;
	
	procedure ABBAlquiler.procesarSoloUnaPatente(min, max: Comparable; queHacer: Procedimiento; unaPatente:integer); 
	begin
		if not self.estasVacio then
			NodoAlquiler(raiz).procesarSoloUnaPatente(min, max, queHacer, unaPatente);
	end;
	
//Procedimientos Programa Principal
	procedure imprimirSoloFiat(unAlquiler: TObject);
	var 
	  alq: Alquiler;
	  s:string;
	  begin
	  // Convertir el TObject a Alquiler
	  alq := unAlquiler as Alquiler;
	  // Verificar si la marca es 'Fiat' y si es así, imprimir los datos del alquiler
	  if (alq.getMarca = 'Fiat') then begin
			  s := alq.toString;
				  writeln(s);
		end;
	end;

	function crearAlquiler (d:Date):Alquiler;
	var
		rg:RandomGenerator;
	begin
		rg:=RandomGenerator.create();
		rg.addLabel('Fiat');
		rg.addLabel('Chevrolet');
		rg.addLabel('Suzuki');
		crearAlquiler:= Alquiler.create(rg.getInteger(00000000,99999999), rg.getInteger(1,30),rg.getInteger(1,3),d,rg.getLabel,rg.getReal(1000,10000));
	end;
	
	procedure simularAlquileres (a:ABBAlquiler);
	var
		i:integer;
		rg:RandomGenerator;
		d:Date;
	begin
		rg:=RandomGenerator.create();
		for i:=1 to AlquileresASimular do begin
			d:= Date.create(rg.getInteger(1,30),rg.getInteger(1,12),rg.getInteger(2023,2024));
			a.agregar(d,crearAlquiler(d))
		end;
	end;
	
	procedure imprimirAlquilerUnaPatente (unAlquiler: TObject);
	var 
		alq: Alquiler;
		s:string;
	 begin
		// Convertir el TObject a Alquiler
		alq := unAlquiler as Alquiler;
		s := alq.toString;
		 writeln(s);
	end;
//PROGRAMA PRINCIPAL
var 
	a : ABBAlquiler;
	dia,mes,anio,dia2,mes2,anio2:integer;
	patente:integer;
BEGIN
	a:= ABBAlquiler.create();
	simularAlquileres(a);
	a.imprimirEnOrden;
	writeln('Seleccionar Fechas');
	writeln('Fecha Minima');
	writeln('Ingresar dia: '); readln(dia);
	writeln('Ingresar mes: '); readln(mes);
	writeln('Ingresar anio: '); readln(anio);
	writeln('Fecha Maxima');
	writeln('Ingresar dia: '); readln(dia2);
	writeln('Ingresar mes: '); readln(mes2);
	writeln('Ingresar anio: '); readln(anio2);
	a.imprimirAcotado(Date.create(dia,mes,anio),Date.create(dia2,mes2,anio2));
	a.procesar(Date.create(0,0,0), Date.create(100,100,3000), @imprimirSoloFiat);
	writeln('Ingresar patente para buscar sus alquileres: '); readln(patente);
	a.procesarSoloUnaPatente(Date.create(0,0,0), Date.create(100,100,3000), @imprimirAlquilerUnaPatente,patente);
END.

