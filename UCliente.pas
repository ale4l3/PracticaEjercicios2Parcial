unit UCliente;
{$mode objfpc}

interface
	uses URandomGenerator, UCajaDeAhorro, UProducto, UTicket, UCarrito, GenericLinkedList;
	type
	Cliente = class
	private
	nombre:string;
	billetera:CajaDeAhorro;
	public
	constructor create(unNmbre: string; unaBilletera: CajaDeAhorro);
	function getNombre():string;
	procedure elegirProductos(unCarrito:Carrito);
	procedure cobrar(t:Ticket; var ok:boolean);
	end;
implementation
	constructor Cliente.create(unNmbre: string; unaBilletera: CajaDeAhorro);
	begin
	nombre:=unNmbre;
	billetera:=unaBilletera;
	end;
	function Cliente.getNombre():string;
	begin
	getNombre:=nombre;
	end;
	procedure Cliente.elegirProductos(unCarrito:Carrito);
	var 
	rg : RandomGenerator;
	p : Producto;
	cant,i: integer;
	begin
	rg:= RandomGenerator.create();

	rg.addlabel('banana');
	rg.addlabel('manzana');
	rg.addlabel('pera');
	rg.addlabel('uva');
	rg.addlabel('pomelo');
	rg.addlabel('mandarina'); 
	rg.addlabel('naranja');
	rg.addlabel('tomate');
	rg.addlabel('frutilla');
	rg.addlabel('lechuga');

	cant:= rg.getInteger(1, 10);
	for i := 1 to cant do begin
		p := Producto.create(rg.getlabel(), rg.getReal(1, 5));
		UnCarrito.agregarProducto(p);
		end;
	end;
	procedure Cliente.cobrar(t:Ticket; var ok:boolean);
	begin
	billetera.extraer(t.getTotalAPagar(), ok);
	end;
END.
