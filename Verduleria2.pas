program Verduleria2;
uses UDateTime, URandomGenerator, genericlinkedlist, UBalanza, UProducto, UCarrito, UTicket;
{type
producto = record
	peso : real;
	nombre : string;
	end;
lista = specialize linkedlist<producto>;

ticket = record
	hora : time; 
	dia : date;
	nombre : string;
	montoTotal : real;
	prod : producto;
	end;
}
procedure CargarCarrito (var c : Carrito);
var 
rg : RandomGenerator;
p : Producto;
cant,i: integer;

begin
c:= Carrito.create;
rg:= RandomGenerator.create();

rg.addlabel('banana');
rg.addlabel('manzana');
rg.addlabel('pera');
rg.addlabel('uva');
rg.addlabel('pomelo');
rg.addlabel('mandarina'); 
rg.addlabel('naranja');
rg.addlabel('tomate');
rg.addlabel('fruutilla');
rg.addlabel('lechuga');

cant:= rg.getInteger(1, 10);
for i := 1 to cant do begin
	p := Producto.create(rg.getlabel(), rg.getReal(1, 5));
	c.agregarProducto(p);
	end;
	
end;

procedure imprimirCarrito(c : Carrito);
begin
writeln('PRODUCTOS: ');

while not l.eol do begin
	writeln(l.current.c);
	writeln(l.current.peso:0:2);
	l.next();
	end;
end;

procedure balanzaTicket(c : Carrito; var t : ticket);
var
b : balanza;
precio : real;
rg : RandomGenerator;
 
 d1,d2: Date; 
 t1,t2: Time;
begin

	b:= Balanza.create();
	rg := RandomGenerator.create;
	l.reset;
while not c.productos.eol do begin
	precio := rg.getReal(1,100);
	b.setPrecioPorKilo(precio);
	b.pesar(c.current.);
	l.next;
	end;
	
ti.montoTotal:= b.getTotalAPagar();
	
d1:= Date.create(1, 9, 2024); 
d2:= Date.create(30, 9, 2024);
ti.dia:= rg.getDate(d1, d2);


t1:= Time.create(7, 00, 00); 
t2:= Time.create(20,00, 00);
ti.hora:= rg.getTime(t1, t2);

ti.nombre := rg.getString(5);


end;

procedure imprimirTicket (ti : ticket);
begin
	writeln('CLIENTE: ', ti.nombre);
	writeln('DIA: ' ,ti.dia.toString());
	writeln('HORA: ' ,ti.hora.toString());
	writeln('TOTAL: ', ti.montoTotal:0:2);
end;

var
c : Carrito;
t : ticket;
i : integer;
begin
for i := 1 to 5 do begin
	cargarCarrito (c);
	imprimirCarrito(c);
	balanzaTicket(c,t);
	imprimirTicket(t);
end;
end.
