program Verduleria1;
uses UDateTime, URandomGenerator, genericlinkedlist, UProducto, UCarrito, Uticket;

{   producto = record
	peso : real;
	nombre : string;
	end;
lista = specialize linkedlist<producto>;
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
WHILE NOT c.productos.eol DO begin
	writeln(c.);
	l.next
	end;
end;

var
c : Carrito;
begin
cargarCarrito (c);

end.
