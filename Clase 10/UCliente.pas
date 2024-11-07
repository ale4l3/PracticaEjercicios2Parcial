unit UCliente;
{$mode objfpc}

interface
	uses URandomGenerator, UCajaDeAhorro, UProducto, UTicket, UCarrito, UTransferencia, GenericLinkedList,UABBGenerico, UProductoEnGondola, UCadena;
	type
		ListaDeCajaDeAhorro = specialize LinkedList<CajaDeAhorro>;
		Cliente = class
			private
				nombre, DNI:string;
				billeteras: ListaDeCajaDeAhorro;
				
			public
				constructor create(unNombre, unDNI: string);
				function getNombre():string;
				function getDNI():string;
				function getCajaAhorro():CajaDeAhorro;
				procedure elegirProductos(unCarrito:Carrito;  unaGondola:ABBGenerico);
				procedure cobrar(t:Ticket; tr: Transferencia; var ok:boolean);
				procedure agregarCaja(unaCaja:CajaDeAhorro);
		end;
	
implementation

	constructor Cliente.create(unNombre, unDNI: string);
	begin
		nombre:=unNombre;
		billeteras:= ListaDeCajaDeAhorro.create();
		DNI:=unDNI;
	end;
	
	function Cliente.getNombre():string;
	begin
		getNombre:=nombre;
	end;
	
	function Cliente.getDNI():string;
	begin
		getDNI:=DNI;
	end;
	
	function Cliente.getCajaAhorro():CajaDeAhorro;
	begin
		billeteras.reset;
		getCajaAhorro:=billeteras.current();
	end;
	
	procedure Cliente.elegirProductos(unCarrito:Carrito; unaGondola:ABBGenerico); //CAMBIE ESTE PRODUCTO PARA QUE EL CLIENTE 
																																    //SAQUE DE LA GONDOLA DE LA VERDULERIA (ABB) UN PRODUCTOGONDOLA
	var 
		rg : RandomGenerator;
		productoGondola:TObject;
		p : Producto;
		cant,i: integer;
		agarroKg{, queda}:real;
		existe:boolean;
	begin
		rg:= RandomGenerator.create();
		rg.addlabel('Banana');
		rg.addlabel('Manzana');
		rg.addlabel('Pera');
		rg.addlabel('Uva');
		rg.addlabel('Pomelo');
		rg.addlabel('Mandarina'); 
		rg.addlabel('Naranja');
		rg.addlabel('Tomate');
		rg.addlabel('Frutilla');
		rg.addlabel('Lechuga');

		cant:= rg.getInteger(1, 10);
		
		for i := 1 to cant do begin //ACA EL CLIENTE SACA UNA CANTIDAD DE STOCK DEL PRODUCTO DE LA GONDOLA QUE ES LO QUE VA A SER EL PESO DEL PRODUCTO
		agarroKg:= rg.getReal(1,3);
		//productoGondola:= TObject.create();
		unaGondola.buscarElemento(Cadena.create(rg.getlabel), productoGondola, existe);
			if (existe)  then begin
				p := Producto.create(ProductoEnGondola(productoGondola).getNombre(), agarroKg);
				{queda:=ProductoEnGondola(productoGondola).getStock - agarroKg;}
				//ACa habria que setear la cantidad del stock pero no se si se puede con las herramientas que vimos en la Clase 9. unaGondola.ProductoEnGondola(productoGondola).setStock(queda);
				UnCarrito.agregarProducto(p);
			end;
		end;
	end;
	
	procedure Cliente.cobrar(t:Ticket;  tr: Transferencia; var ok:boolean);
	var
		unMonto:real;
	begin
		ok:=false;
		unMonto:=t.getTotalAPagar();
		billeteras.reset();
		t.imprimir();
		writeln ('CLIENTE: ', nombre, '. Iniciando intento de pago...');
		while (not billeteras.eol) and not ok do begin
			tr.transferir(billeteras.current(), unMonto, ok);
			if not ok then
				billeteras.next();
		end;
			if not ok then
			writeln('CLIENTE: ', nombre,'. PAGO RECHAZADO. SALDO INSUFICIENTE.');
	end;
	
	procedure Cliente.agregarCaja(unaCaja:CajaDeAhorro);
	begin
		billeteras.add(unaCaja);
	end;
	
END.
