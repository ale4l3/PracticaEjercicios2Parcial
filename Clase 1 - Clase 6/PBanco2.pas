{ ACTIVIDAD 8: Cree el archivo Banco2.pas
Se desea modificar el programa de la actividad anterior para que el banco pueda manejar sus 7 sucursales. Cada sucursal maneja 15 cajas de ahorro.
● Implemente un módulo que cree las cajas de ahorro de todas las sucursales.
● Implemente un módulo que simule 45 operaciones sobre las cajas de ahorro de las distintas sucursales. Por cada operación debe elegir al
azar una caja de ahorro y una sucursal e invocar al módulo. SimularMovimiento implementado en la actividad anterior.
● Implemente un módulo que imprima el saldo de las cajas de ahorro.
● Implemente un módulo que devuelva el número de sucursal que más dinero tiene. El dinero de una sucursal es la suma de los saldos de
todas sus cajas de ahorro.
● Haga un programa que invoque a los cuatro módulos y compruebe el correcto funcionamiento del mismo.}


program PBanco2;
uses UCajaDeAhorro, URandomGenerator;
type
	vCajasAhorro = array [1..15,1..7] of CajaDeAhorro;

procedure crearCajasAhorro (var vCajas:vCajasAhorro);
var
i, j,n:integer;
begin
	n:=0;
	for j:=1 to 7 do
		for i:=1 to 15 do begin
			n:= 1 + n;
			vCajas[i,j]:= CajaDeAhorro.create(n);
		end;
end;

procedure simularMovimiento (unaCajaAhorro:CajaDeAhorro; var ok:boolean);
var
rg:RandomGenerator;
begin
	rg:= RandomGenerator.create();
	if rg.getBoolean then begin
		unaCajaAhorro.depositar(rg.getReal(1,100000));
		ok:=true;
	end
	else
		unaCajaAhorro.extraer(rg.getReal(1,100000),ok);
end;

procedure	operaciones(vCajas:vCajasAhorro);
var 
i:integer;
rg:RandomGenerator;
ok:boolean;
begin
	rg:= RandomGenerator.create();
	for i:=1 to 45 do begin
		simularMovimiento(vCajas[rg.getInteger(1,15),rg.getInteger(1,7)], ok);
		if ok then
			writeln('Operacion exitosa')
		else
			writeln('No se realizo la operacion');
	end;
end;

procedure imprimirCajas (vCajas:vCajasAhorro);
var
i,j:integer;
begin
		for j:=1 to 7 do
			for i:=1 to 15 do 
				writeln('La caja ', vCajas[i,j].getNumero, ' tiene un saldo de: ',  vCajas[i,j].consultarSaldo():2:0);
end;

var 
	vCajas:vCajasAhorro;
BEGIN
	crearCajasAhorro(vCajas);
	operaciones(vCajas);
	imprimirCajas(vCajas);
END.

