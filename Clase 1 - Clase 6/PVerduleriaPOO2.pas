{Actividades en Máquina
ACTIVIDAD 2: Crear el archivo Verdulería1.pas.
● Implemente un módulo CargarCarrito que simule la carga del carrito en una verdulería. Use el objeto RandomGenerator para elegir al azar la
cantidad de productos a comprar, los productos a comprar y el peso de cada producto. NOTA: cargue previamente el objeto RandomGenerator con 10 productos típicos de una verdulería, usando el método addLabel.
● Implemente un módulo que reciba la información generada en CargarCarrito y la imprima por consola.
● Escriba un programa que invoque los métodos implementados y pruebe el correcto funcionamiento del mismo.

ACTIVIDAD 3: Crear el archivo Verdulería2.pas.
Modifique el programa de la actividad 2 para realizar las modificaciones pedidas en esta actividad.
● Implemente un módulo que pase todos los productos del carrito (información recolectada en el módulo CargarCarrito) por la balanza y
calcule el total a pagar. Los precios por kilo de cada producto puede ser elegido al azar.
Este módulo debe generar un ticket de compra con la siguiente información:
○ hora y dia (al azar entre el 1/9/2024 y el 30/9/2024)
○ nombre del cliente (un string al azar)
○ monto total a pagar (calculado con la balanza)
○ nombre de los productos comprados y sus respectivos pesos (información generada en el módulo CargarCarrito).

ACTIVIDAD 4: Crear el archivo Verdulería3.pas.
Modifique el programa de la actividad 3 para realizar las modificaciones pedidas en esta actividad.
● Implemente un módulo que reciba un ticket de compra e imprima por consola toda su información.
● Escriba un programa que invoque los métodos implementados y pruebe el correcto funcionamiento del mismo.



ACTIVIDAD 2: Crear el archivo VerduleriaPOO1.pas
Modifique la actividad 5 de la clase 1, haciendo los cambios necesarios para usar los objetos Producto, Carrito y Ticket recientemente implementados.
Modifique el programa de la actividad anterior.
• Realice las modificaciones necesarias para almacenar los tickets generados en cada compra.
• Implemente un módulo recursivo que reciba todos los tickets generados y devuelva la cantidad de tickets con más de tres productos.
• Implemente un módulo recursivo que reciba todos los tickets generados
y devuelva aquellos cuyo total a pagar es mayor a un monto recibido por
parámetro.
• Escriba un programa que genere 20 compras, almacenando los 20
tickets, imprima cuántos corresponden a compras con más de tres
productos. Finalmente imprima solo aquellos cuyo total a pagar es
mayor a un monto leído por teclado.}


program PVerduleriaPOO2.pas;

uses URandomGenerator, GenericLinkedList ,UDateTime,UBalanza,UProducto,UTicket,UCarrito;

procedure random(var rg:randomgenerator);
var 
vproducto:array[1..10] of string=('Espinaca','Rucula','Papa','Lechuga','Tomate','Remolacha','Limones','Manzana','Banana','Cebolla');
i:integer;
begin
for i:=1 to 10 do
begin
rg.addlabel(vproducto[i]);
end;
end;

procedure leerproducto (p:Producto; rg:randomgenerator);
begin
p.nombre:=rg.getlabel(); //set?
p.peso:=rg.getReal(1.1,10.99);
end;

procedure imprimircarrito(l: lista);
begin
    l.reset();
    writeln('       Producto          |  Peso (kg)');
    writeln('-------------------------|-----------');
    while not l.eol do 
    begin
        write(l.current.nombre:25); 
        writeln('|', l.current.peso:9:2);  
        l.next();
    end;
    writeln('-------------------------|-----------');
end;

procedure GenerarTicket(l:lista;var t:ticket);
var
b:balanza;
rg:RandomGenerator;
precio:real;
begin
//Instanciamos los objetos
rg:=RandomGenerator.create();
b:=balanza.create();
b.limpiar();

t.productos:=l;
//Cargo cliente
cuerpoTicket(t);

// Llamo lista y reseteo
t.productos.reset();
	while not t.productos.eol do 
	begin
	precio:=rg.getreal(1000.00,4000.99);
	b.setPrecioPorKilo(precio);
	b.pesar(t.productos.current.peso);
	l.next();
	end;
	t.monto:=b.getTotalapagar();
	imprimirTicket(t,b);
end;

function cantidadTicketsConMayor3 (v:vTickets):integer;
var	
begin

end;

var
l:lista;
t:ticket;
i:integer;
BEGIN
for i:=1 to 5 do 
	begin
		cargarcarrito(l);
		writeln(' Orden de Compra OC-', i);
		GenerarTicket(l,t);
	end;
END.

