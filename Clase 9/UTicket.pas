unit UTicket;
{$mode objfpc}

interface
	uses genericlinkedlist, UProducto, UDateTime;
	type
		productos = specialize linkedlist <Producto>;
		
		Ticket = class
			private
				p : productos;
				cantidadDeProductos: integer;
				cliente: string;
				hora: Time;
				dia: Date;
				totalAPagar: real;

			public
				constructor create(unaHora: Time; unDia: Date);
				procedure setCliente(unCliente: string);
				procedure setTotalAPagar(unTotalAPagar: real);
				function getTotalAPagar():real;
				function getCliente():string;
				procedure agregarProducto(unProducto: Producto);
				function cuantosProductosTenes(): integer;
				procedure imprimir();
		end;

implementation
	
	constructor Ticket.create(unaHora: Time; unDia: Date);
		begin
			cantidadDeProductos := 0;
			p:= productos.create();
			cliente := 'zzz';
			totalAPagar := 0;
			hora := unaHora;
			dia := unDia;
		end;
		
	procedure Ticket.setCliente(unCliente : string);
		begin
			cliente := unCliente;
		end;
		
	function Ticket.getCliente():string;
		begin
			getCliente:=cliente;
		end;
	
	procedure Ticket.setTotalAPagar(unTotalAPagar : real);
		begin
			totalAPagar := unTotalAPagar;
		end;
	
	function Ticket.getTotalAPagar():real;
		begin
			getTotalAPagar := TotalAPagar;
		end;
	
	procedure Ticket.agregarProducto(unProducto: Producto);
		begin
			p.add(unProducto);
			cantidadDeProductos := cantidadDeProductos + 1;
		end;
		
	function Ticket.cuantosProductosTenes(): integer;
		begin
			cuantosProductosTenes := cantidadDeProductos;
		end;
		
	procedure Ticket.imprimir();
	begin
		writeln('');
		writeln('::::::::::::::::::::::::::TICKET::::::::::::::::::::::::::::');
		writeln('');
		writeln('Cliente: ', cliente);
		writeln('Hora: ', hora.getHour, '. Dia: ', dia.getDay);
		writeln('');
		writeln ('PRODUCTOS: ');
		p.reset();
		while not p.eol() do begin
			writeln ('Producto: ', p.current().getDescripcion(), '. Precio:', p.current().toString, '. Peso: ', p.current().getPeso:2:0, ' kg. ');
			p.next();
		end;
		writeln (':::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::');
		writeln ('');
		writeln ('TOTAL A PAGAR: ', totalAPagar:2:0);
		writeln ('');
		writeln (':::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::');
	end;

end.
