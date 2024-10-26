unit UCliente;
{$mode objfpc}

interface
	uses URandomGenerator, UCajaDeAhorro, UProducto, UTicket, UCarrito, UTransferencia, GenericLinkedList;
	type
		ListaDeCajaDeAhorro = specialize LinkedList<CajaDeAhorro>;
		Cliente = class
			private
				nombre:string;
				billeteras: ListaDeCajaDeAhorro;
				
			public
				constructor create(unNombre: string);
				function getNombre():string;
				procedure elegirProductos(unCarrito:Carrito);
				procedure cobrar(t:Ticket; tr: Transferencia; var ok:boolean);
				procedure agregarCaja(unaCaja:CajaDeAhorro);
		end;
	
implementation

	constructor Cliente.create(unNombre: string);
	begin
		nombre:=unNombre;
		billeteras:= ListaDeCajaDeAhorro.create();
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
	
	procedure Cliente.cobrar(t:Ticket;  tr: Transferencia; var ok:boolean);
	var
		unMonto:real;
	begin
		ok:=false;
		unMonto:=t.getTotalAPagar();
		billeteras.reset();
		while (not billeteras.eol) and not ok do begin
			tr.transferir(billeteras.current(), unMonto, ok);
			if not ok then
				billeteras.next()
			else if ok then begin
			t.imprimir();
			
			writeln (':::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::');
			writeln ('');
			writeln('CLIENTE: ', nombre,'. CUENTA: ',  billeteras.current().getNumero, '. MONTO INICIAL: ', billeteras.current().consultarSaldo():2:0);
			billeteras.current().extraer(unMonto,ok);
			writeln('CLIENTE: ', nombre,'. CUENTA: ',  billeteras.current().getNumero, '. MONTO FINAL: ', billeteras.current().consultarSaldo():2:0);
			writeln ('');
			writeln (':::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::');

			end;
		end;
			if not ok then
			writeln('CLIENTE: ', nombre,'. No pudo realizar la compra. SIN SALDO');
	end;
	
	procedure Cliente.agregarCaja(unaCaja:CajaDeAhorro);
	begin
		billeteras.add(unaCaja);
	end;
	
END.
