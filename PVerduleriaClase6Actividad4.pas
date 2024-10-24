{ACTIVIDAD 4: Cree el archivo PVerduleria.pas
Pruebe las clases creadas creando un programa que instancie una
verdulería, un cliente y haga que el cliente vaya a comprar a la verdulería.
Imprima el saldo inicial de la caja de ahorro del cliente, imprima el ticket
generado y el saldo final de la caja de ahorro del cliente para comprobar el
correcto funcionamiento del programa.}
program PVerduleriaClase6Actividad456789;
{$mode objfpc}
uses UCliente, UVerduleria, UCajaDeAhorro;
const DimF=15;
type
	vectorClientes = array [1..DimF] of Cliente;
	
procedure cargarNombre (n:string);
var
	vNombre: array [1..15] of string = (' Ana ', ' Pedro ', ' Laura ', ' Marcos ', ' Sofía ', ' Juan ', ' Carla ', ' Diego ', ' Lucía ', ' Martín ', ' Valeria ', ' Pablo ', ' Natalia ', ' Andrés ', ' Gabriela ');
begin
	n:= vNombre[random(15) + 1];
end;


var 
	cajaAhorro:CajaDeAhorro;
	v: Verduleria;
	vClientes:vectorClientes;
	saldoInicialCliente, saldoFinalCliente:real;
	i,j,r:integer;
	nombre:string;
BEGIN
	randomize;
	nombre:= 'zzz';
	v:= Verduleria.create('Granjita');
	for i:=1 to DimF do begin
		cargarNombre(nombre);
		vClientes[i]:= Cliente.create(nombre);
		r:= random(5) + 1;
		for j:=1 to r do begin
			cajaAhorro:= CajaDeAhorro.create(j);
			vClientes[i].agregarCaja(cajaAhorro);
		end;
	end;
	v.atender(cliente1);
	
	
	writeln('Saldo Inicial Cliente', saldoInicialCliente);
	
	
END.

