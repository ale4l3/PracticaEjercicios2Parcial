{ACTIVIDAD 5: Cree el archivo ArbolDeClientes.pas
● Implemente un módulo cargarArbol que reciba un ABB y lo llene con
clientes al azar, hasta la aparición del nombre ‘ZZZ’. Para cada cliente creele
una caja de ahorro con un saldo también elegido al azar. Use el DNI del
cliente como clave.
● Implemente un módulo que reciba un ABB de clientes y un DNI e imprima
cuanto dinero tiene ese cliente, si es que el cliente existe dentro del árbol.
Use: abb.buscarElemento(unaClave, unDato, existe);
● Implemente un módulo que reciba un ABB de clientes y dos nombres, e
imprima el saldo de todos los clientes que están dentro del rango formado
por los dos nombres recibidos por parámetro.
● Escriba un programa que instancie un ABB de clientes e invoque a los tres
módulos implementados.
}
program ArbolDeClientes;
uses genericlinkedlist, UDateTime, UCliente, UVerduleria, UCajaDeAhorro, UCaja, UProducto, UCarrito, UTicket, UABBgenerico, URandomGenerator, UCadena;

procedure cargarEtiquetas (rg:RandomGenerator);
var
	i:integer;
	vNombre: array [1..15] of string = ('Ana', 'Pedro', 'Laura', 'Marcos', 'Sofia', 'Juan', 'Carla', 'Diego', 'Lucia', 'Martin', 'Valeria', 'Pablo', 'Natalia', 'Andres', 'Gabriela');
begin
	for i:=1 to 15 do
		rg.addLabel(vNombre[random(15) + 1]);
	rg.addLabel('ZZZ');
end;

procedure cargarDNI (rg:RandomGenerator);
var
	i:integer;
	vDNI: array [1..20] of string = ('1234567', '8765432', '2345678', '7654321', '3456789', '6543210', '4567890', '5678901', '6789012', '7890123', 
														'8901234', '9012345', '2345671', '7654312', '8765423', '9876534', '3456123', '4567234', '5678345', '6789456');
begin
	for i:=1 to 20 do
		rg.addLabel(vDNI[random(20) + 1]);
end;

procedure cargarClientesYCuentas (a:ABBGenerico);
	var
		cajaAhorro:CajaDeAhorro;
		rgNombres,rgDNI:RandomGenerator;
		s,dni:string;
		unCliente:Cliente;
		unaCadena:Cadena;
	begin
		rgNombres := RandomGenerator.create();
		rgDNI := RandomGenerator.create();
		cargarEtiquetas(rgNombres);
		cargarDNI(rgDNI);
		s:=rgNombres.getLabel;
		while (s <> 'ZZZ') do begin
			dni:=rgDNI.getLabel;
			unaCadena:= Cadena.create(dni);
			unCliente:= Cliente.create(s,dni);
			writeln('Se agrego cliente: ',s);
			writeln('Se agrego dni: ',dni);
			cajaAhorro:= CajaDeAhorro.create(rgDNI.getInteger(1,10)); //use este rg solo para generar un numero random para la caja, no tiene nada que ver con el dni
			unCliente.agregarCaja(cajaAhorro);
			cajaAhorro.depositar(random(10000));
			a.agregar(unaCadena,unCliente);
			s:=rgNombres.getLabel;
		end;
	end;

procedure consultarSaldoCliente (a:ABBGenerico; dni:string);
var
unCliente:TObject;
// la cadena es la clave, hay pasar el string a la cadena para que sea un comparable y asi el arbol lo pueda usar como clave dentro de Clave Dato e ir guardandolo
existe:boolean;
caja:CajaDeAhorro;
begin
	existe:=false;
	a.buscarElemento(Cadena.create(dni), unCliente, existe);
	if existe then begin
		caja:= Cliente(unCliente).getCajaAhorro;
		writeln('Saldo: ', caja.consultarSaldo:2:0);
	end;
end;

{procedure consultarSaldo2Clientes (a:ABBGenerico; n1,n2:string)
unCliente:TObject;
existe:boolean;
caja:CajaDeAhorro;
begin
	existe:=false;
	a.buscarElemento(Cadena.create(dni), unCliente, existe);
	if existe then begin
		caja:= Cliente(unCliente).getCajaAhorro;
		writeln('Saldo: ', caja.consultarSaldo:2:0);
	end;
end;}

var 
a: ABBGenerico;
dni:string;

BEGIN
	writeln('Empieza programa: ');
	a:= ABBGenerico.create();
	cargarClientesYCuentas(a);
	a.imprimirEnOrden(); //Porque imprime CLiente? Porque hace un string del objeto cliente, no hace el get string de cada cliente
	writeln('Escribir dni: '); readln(dni);
	consultarSaldoCliente(a,dni);
END.

