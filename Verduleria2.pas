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
	var
	i:integer;
	l:p;
	begin
	writeln('PRODUCTOS: ');
	l:=c.getListaProductos();
	for i:=1 to c.cuantosProductosTenes() do begin
		writeln(l.current().getDescripcion());
		writeln(l.current.getPeso:0:2);
		l.next();
	end;
end;

procedure balanzaTicket(c : Carrito; var t : ticket);
	var
	b : balanza;
	precio : real;
	rg : RandomGenerator;
	i:integer;
	d1,d2: Date; 
	t1,t2: Time;
	begin
		b:= Balanza.create();
		rg := RandomGenerator.create;
	for i:=1 to c.cuantosProductosTenes() do begin
		precio := rg.getReal(1,100);
		b.setPrecioPorKilo(precio);
		b.pesar(c.getCurrentProducto().getPeso());
	end;
	t.setTotalAPagar(b.getTotalAPagar());
	d1:= Date.create(1, 9, 2024); 
	d2:= Date.create(30, 9, 2024);
	t1:= Time.create(7, 00, 00); 
	t2:= Time.create(20,00, 00);
	t.create(rg.getTime(t1, t2), rg.getDate(d1, d2));
	t.setCliente(rg.getString(5));
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
		t.imprimir();
	end;
end.
