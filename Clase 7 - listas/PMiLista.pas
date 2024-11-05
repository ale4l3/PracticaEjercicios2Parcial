{ACTIVIDAD 5: Cree el archivo MiLista.pas
Cree un programa que instancie una Lista, le agregue nombres de personas
hasta la aparición del nombre ‘ZZZ’ e imprima los nombres en el orden en
que fueron almacenados y en el orden inverso, como así también la
cantidad de elementos almacenados.
Nota: use RandomGenerator para la elección al azar de los nombres.}
program PMiLista;

uses UNodoClase7,ULista,URandomGenerator;


procedure cargarLista(l: Lista; rg:RandomGenerator);
var

s:string;
begin
	
	rg.addLabel('Carla');
	rg.addLabel('Roberto');
	rg.addLabel('Carlos');
	rg.addLabel('Agustin');
	rg.addLabel('Jose');
	rg.addLabel('Ariel');
	rg.addLabel('Leandro');
	rg.addLabel('Pedro');
	rg.addLabel('ZZZ');
	s:=rg.getLabel ;
	while s  <> 'ZZZ' do begin
		l.agregar(s);
		s:=rg.getLabel;
	end;
end;
var 
	l,l2 : Lista;
	rg:RandomGenerator;
	i:integer;
	s:string;
BEGIN
	rg:= RandomGenerator.create();
	l:= Lista.create();
	cargarLista(l, rg);
	l.imprimir();
	writeln('::::::::::::::::');
	l.imprimirInverso();
	writeln('Cantidad de nombres: ',l.cantidadDeDatos());
	for i:=1 to l.cantidadDeDatos() do begin
		s:=rg.getLabel;
		if l.existeElemento(s) then
			writeln('El elemento ',s, ' esta en la lista.')
		else
			writeln('El elemento ',s, ' no esta en la lista.');
	end;
	l2:= Lista.create();
	l2.agregar('Alejandro');
	l2.agregar('Branco');
	l2.agregar('Carla');
	l2.agregar('Daniela');
	l2.agregar('Ezequiel');
	l2.agregar('Francisca');
	l2.agregar('Gabriela');
	l2.agregar('Hugo');
	l2.agregar('Ignacio');
	l2.agregar('Jonathan');
	l2.agregar('Karina');
	l2.agregar('Lara');
	l2.agregar('Melina');
	l2.agregar('Orlando');
	l2.agregar('Saturno');
	writeln('::::::::::::::::');
	l2.imprimirMayores('JJJ');
	writeln('::::::::::::::::');
	l2.imprimirMenores('OOO');
	writeln('::::::::::::::::');
	l2.imprimirAcotado('JJJ','OOO');
	writeln('::::::::::::::::');
END.

