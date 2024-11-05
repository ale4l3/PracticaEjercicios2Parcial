{Se desea hacer un programa para que un banco maneje sus 15 cajas de ahorro.
● Implemente un módulo que cree las cajas de ahorro.
● Implemente un módulo SimularMovimiento que reciba una caja de ahorro por parámetro y que deposite o extraiga una suma generada al azar. 
La acción de depositar o extraer debe ser determinada al azar. Este módulo además debe informar el éxito o no de la operación.
● Implemente un módulo que simule 30 operaciones sobre las cajas de ahorro. Por cada operación debe elegir al azar una caja de ahorro e
invocar al módulo SimularMovimiento.
● Implemente un módulo que imprima el saldo de todas las cajas de ahorro.
● Haga un programa que invoque a los cuatro módulos implementados y
compruebe el correcto funcionamiento del mismo.
}
program PBanco1;
uses UCajaDeAhorro, URandomGenerator;
type
	vCajasAhorro = array [1..15] of CajaDeAhorro;

procedure crearCajasAhorro (var vCajas:vCajasAhorro);
var
i:integer;
begin
	for i:=1 to 15 do 
		vCajas[i]:= CajaDeAhorro.create(i);
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
	for i:=1 to 30 do begin
		simularMovimiento(vCajas[rg.getInteger(1,15)], ok);
		if ok then
			writeln('Operacion exitosa')
		else
			writeln('No se realizo la operacion');
	end;
end;

procedure imprimirCajas (vCajas:vCajasAhorro);
var
i:integer;
begin
	for i:=1 to 15 do
		writeln('La caja ', vCajas[i].getNumero, ' tiene un saldo de: ',  vCajas[i].consultarSaldo():2:0);
end;

var 
	vCajas:vCajasAhorro;
BEGIN
	crearCajasAhorro(vCajas);
	operaciones(vCajas);
	imprimirCajas(vCajas);
END.

