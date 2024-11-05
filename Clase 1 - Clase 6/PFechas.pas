{ACTIVIDAD 3: Crear el archivo Fechas.pas
● Implemente un módulo que cargue un vector de 15 fechas de nacimiento elegidas al azar.
● Implemente un módulo que reciba un vector de fechas y una fecha a buscar y devuelva si existe en el vector.
● Implemente un módulo que reciba un vector de fechas y devuelva la fecha de la persona más jóven.
● Implemente un módulo que reciba un vector de fechas y lo devuelva ordenado de menor a mayor.
● Implemente un módulo que reciba un vector de fechas y las imprima por consola.
● Escriba un programa que invoque a todos los módulos implementados y compruebe el correcto funcionamiento del mismo.}


program PFechas;

uses UDateTime, URandomGenerator;
const DimF = 15;
type
	fechaHora = record
		fecha:Date;
		hora:Time;
	end;
	vectorFechas = array [1..DimF] of fechaHora;
	
procedure cargarVectorFechas (var v:vectorFechas);
var 
	rg:RandomGenerator;
	i:integer;
begin
	rg:= RandomGenerator.create;
	v[15].fecha:= Date.create(24,09,1990);
	v[15].hora:= Time.create(02,02,02);
	v[1].fecha:= Date.create(23,09,1990);
	v[1].hora:= Time.create(03,03,03);
	for i:=2 to 14 do begin
			v[i].fecha:= Date.create(rg.getInteger(1,28)+1,rg.getInteger(1,12),rg.getInteger(1,100)+1923);
			v[i].hora:= Time.create(rg.getInteger(1,24),rg.getInteger(1,60),rg.getInteger(1,60));
	end;
end;

function buscarFecha (v:vectorFechas; f:fechaHora):boolean;
var 
	i:integer;
begin
	i:=1;
	while not v[i].fecha.Equals(f.fecha) do
		i:= i +1;
	if v[i].fecha.Equals(f.fecha) then
		buscarFecha:=true
	else
		buscarFecha:=false;
end;

function buscarMaxFecha (v:vectorFechas):Date;
var 
	maxFecha:Date;
	i:integer;
begin
	maxFecha:= Date.create(00,00,0000);
	for i:=1 to DimF do
		if v[i].fecha.greaterThan(maxFecha) then
			maxFecha:= v[i].fecha;
	buscarMaxFecha:=maxFecha;
end;

procedure ordenarFechasMenorAMayor (var v:vectorFechas);
var 
	i,j:integer;
	minFecha:Date;
	minHora:TIme;
begin
		minFecha:= Date.create(99,99,9999);
	for i:=1 to DimF-1 do begin
		for j:=i+1 to DimF do begin
			if v[j].fecha.lessThan(v[i].fecha) then begin
				minFecha:= Date.create(v[j].fecha.getDay, v[j].fecha.getMonth, v[j].fecha.getYear);
				minHora:= Time.create(v[j].hora.getHour, v[j].hora.getMinutes, v[j].hora.getSeconds);
				v[j].fecha:= Date.create(v[i].fecha.getDay, v[i].fecha.getMonth, v[i].fecha.getYear);
				v[j].hora:= Time.create(v[i].hora.getHour, v[i].hora.getMinutes, v[i].hora.getSeconds);
				v[i].fecha:= Date.create(minFecha.getDay, minFecha.getMonth, minFecha.getYear);
				v[i].hora:= Time.create(minHora.getHour, minHora.getMinutes, minHora.getSeconds);
			end;
		end;
	end;
end;

procedure imprimirVectorFechas (v:vectorFechas);
var 
	i:integer;
begin
	for i:=1 to DimF do
		writeln('Fecha Nacimiento: ',v[i].fecha.toString(), '. Hora Nacimiento: ', v[i].hora.toString());
end;
var
	v:vectorFechas;
	f:fechaHora;
BEGIN
	cargarVectorFechas (v);
	f.fecha:= Date.create(24,09,1990);
	if buscarFecha(v,f) then
		writeln('La fecha se encontro: ', f.fecha.toString());
	writeln('La fecha nacimiento de la persona mas joven: ', buscarMaxFecha(v).toString());
	imprimirVectorFechas(v);
	ordenarFechasMenorAMayor(v);
	writeln('Fechas ordenadas de menor a mayor: ');
	imprimirVectorFechas(v);
END.

