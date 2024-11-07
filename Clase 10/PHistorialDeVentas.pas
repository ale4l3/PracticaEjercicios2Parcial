{ACTIVIDAD 1: Cree el archivo HistorialDeVenta.pas
Modifique el programa de la actividad 8 de la clase anterior para que la
verdulería lleve la contabilidad de cuántos productos (bolsas) vende de
cada fruta y verdura, junto con el peso total vendido de cada producto.
Para ello cree las clases NodoHistorial y ABBHistorial y modifique la clase
verdulería para mantener el historial pedido.
Agregue un nuevo método a verdulería llamado cerrar que imprima el árbol
con el historial de ventas. Haga un programa principal que simule la
atención de cinco clientes y luego invoque al método cerrar.}
program PHistorialDeVentas;

uses genericlinkedlist, UDateTime, URandomGenerator, UCliente, UVerduleria, UCajaDeAhorro, UCaja, UProducto, UCarrito, UTicket, UCadena, UABBGenerico, UProductoEnGondola;
const DimF=15;
type
	vectorClientes = array [1..15] of Cliente;

procedure crearProductosParaLaGondola (v:Verduleria);  //Agregamos modula para crear la gondola
var 
	rg : RandomGenerator;
begin
	rg:= RandomGenerator.create();
	v.crearProductoEnGondola('Banana', rg.getReal(1,10), rg.getReal(100,1000));
	v.crearProductoEnGondola('Manzana', rg.getReal(1,10), rg.getReal(100,1000));
	v.crearProductoEnGondola('Pera', rg.getReal(1,10), rg.getReal(100,1000));
	v.crearProductoEnGondola('Uva',rg.getReal(1,10), rg.getReal(100,1000));
	v.crearProductoEnGondola('Pomelo', rg.getReal(1,10), rg.getReal(100,1000));
	v.crearProductoEnGondola('Mandarina', rg.getReal(1,10), rg.getReal(100,1000));
	v.crearProductoEnGondola('Naranja', rg.getReal(1,10), rg.getReal(100,1000));
	v.crearProductoEnGondola('Tomate', rg.getReal(1,10), rg.getReal(100,1000));
	v.crearProductoEnGondola('Frutilla', rg.getReal(1,10), rg.getReal(100,1000));
	v.crearProductoEnGondola('Lechuga', rg.getReal(1,10), rg.getReal(100,1000));
end;	

procedure cargarEtiquetas (rg:RandomGenerator);
var
	i:integer;
	vNombre: array [1..15] of string = (' Ana ', ' Pedro ', ' Laura ', ' Marcos ', ' Sofia ', ' Juan ', ' Carla ', ' Diego ', ' Lucia ', ' Martin ', ' Valeria ', ' Pablo ', ' Natalia ', ' Andres ', ' Gabriela ');
begin
	for i:=1 to 15 do
		rg.addLabel(vNombre[random(15) + 1]);
end;

procedure cargarClientesYCuentas (var vClientes:vectorClientes);
var
	cajaAhorro:CajaDeAhorro;
	i,j,r:integer;
	rg:RandomGenerator;
begin
	rg := RandomGenerator.create();
	cargarEtiquetas(rg);
	for i:=1 to 15 do begin
		vClientes[i]:= Cliente.create(rg.getLabel, '000000000');
		r:= random(3) + 1;
		for j:=1 to r do begin	
			cajaAhorro:= CajaDeAhorro.create(j);
			if j=2 then 			
				cajaAhorro.depositar(random(10000));
			vClientes[i].agregarCaja(cajaAhorro);		
		end;
	end;
end;

procedure atenderClientes (var v: Verduleria; var vClientes:vectorClientes);
var
	i:integer;
begin
	for i:=1 to DimF do
		v.atender(vClientes[i]);
end;

var 
	v: Verduleria;
	CuentaVerduleria:CajaDeAhorro;
	vClientes:vectorClientes;

BEGIN
	randomize;
	cuentaVerduleria:= CajaDeAhorro.create(1);
	v:= Verduleria.create('Granjita', cuentaVerduleria);
	crearProductosParaLaGondola(v); //Ahora lo que agregamos es crear la gondola con los productos
	cargarClientesYCuentas(vClientes);
	atenderClientes(v,vClientes);

END.

