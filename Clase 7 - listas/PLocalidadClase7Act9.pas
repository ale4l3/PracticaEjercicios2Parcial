{Escriba un programa que lea patentes de automóviles que pasan por una
calle hasta leer la patente ‘ZZ999ZZ’. Se asume que las patentes se leen
ordenados de menor a mayor.
● Almacene las patentes leídas en una Lista.
● Lea una patente por teclado e informe si el valor leído se encuentra o
no en la lista.
● Imprima las patentes menores a un valor leído por teclado
● Imprima las patentes mayores a un valor leído por teclado
● Imprima las patentes que se encuentran entre dos valores leídos por
teclado.}

program PLocalidadClase7Act9;

uses UNodoClase7,ULista,URandomGenerator, GenericLinkedList;
type
	listaA = specialize LinkedList <string>;

procedure cargarLabels (rg:RandomGenerator);
begin
	
	rg.addLabel('AA123AA');
	rg.addLabel('AA170AA');
	rg.addLabel('AA222AA');
	rg.addLabel('AA777AA');
	rg.addLabel('BB456BB');
	rg.addLabel('CC789CC');
	rg.addLabel('DD101DD');
	rg.addLabel('EE202EE');
	rg.addLabel('FF303FF');
	rg.addLabel('GG404GG');
	rg.addLabel('HH505HH');
	rg.addLabel('II606II');
	rg.addLabel('JJ707JJ');
	rg.addLabel('KK808KK');
	rg.addLabel('LL909LL');
	rg.addLabel('MM010MM');
	rg.addLabel('NN111NN');
	rg.addLabel('OO212OO');
	rg.addLabel('PP313PP');
	rg.addLabel('QQ414QQ');
	rg.addLabel('RR515RR');
	rg.addLabel('SS616SS');
	rg.addLabel('TT717TT');
	rg.addLabel('ZZ999ZZ');
end;

procedure insertarOrdenado(var lA:listaA; s:string);
begin
	lA.reset();
	while (not lA.eol) and (s > lA.current()) do	
		lA.next();
	lA.insertCurrent(s);
end;

procedure cargarListaAlmacenamiento (var lA:listaA);
var
rg:RandomGenerator;
s:string;
begin
	rg:= RandomGenerator.create();
	cargarLabels(rg);
	lA:= listaA.create();
	s:= rg.getLabel;
	while s <> 'ZZ999ZZ' do begin
		insertarOrdenado(lA, s);
		s:=rg.getLabel;
	end;
end;

procedure cargarListaOrdenadaPatentes (lP:Lista);
var
lA:listaA;
begin
	cargarListaAlmacenamiento(lA);
	while not lA.eol do begin
		lP.agregar(lA.current);
		lA.next();
	end;
end;

var
lP:Lista;
BEGIN
	lP:= Lista.create(); //ver,  si o si tengo que crearlo en el programa principal. O era solo para el vector.
	cargarListaOrdenadaPatentes(lP);
	writeln('::::::::::::::::');
	lP.imprimir();
	writeln('::::::::::::::::');
	writeln('::::::::::::::::');
	lP.imprimirInverso();
	writeln('::::::::::::::::');
	if lP.existeElemento('QQ414QQ') then
		writeln('El elemento QQ414QQ esta en la lista')
	else
		writeln('El elemento QQ414QQ no esta en la lista');
	writeln('::::::::::::::::');
	writeln('Patentes mayores a HH505HH: ');
	lP.imprimirMayores('HH505HH');
	writeln('::::::::::::::::');
	writeln('Patentes menores a RR515RR: ');
	lP.imprimirMenores('RR515RR');
	writeln('::::::::::::::::');
	writeln('Patentes mayores a HH505HH y menores a OO212OO: ');
	lP.imprimirAcotado('HH505HH','OO212OO');
	writeln('::::::::::::::::');
END.

