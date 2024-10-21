{ACTIVIDAD 3: Crear el archivo UVerduleria.pas
Cree un objeto Verduleria para representar a la verdulería.
 El método atender debe:
1. Crear un carrito vacío
2. Simular el llenado del carrito
3. Generar el ticket
4. Cobrarle al cliente pasándole el ticket generado}
unit UVerduleria;
{$mode objfpc}
interface

	uses UCaja, UCliente, UCarrito, UTicket, genericlinkedlist, UProducto, UDateTime, URandomGenerator;
	
	type
	
		Verduleria = Class
			private
				nombre: string;
				vCaja: Caja;
			public
				constructor create(unNombre: string);
				procedure atender(unCliente: Cliente);
					
		end;
	
implementation	
	
		constructor Verduleria.create(unNombre: string);
			begin
				nombre:=unNombre;
				vCaja:= Caja.create();
			end;
			
		procedure Verduleria.atender(unCliente: Cliente);
		var
			c:Carrito;
			t:Ticket;
			ok:boolean;
		begin
			c := Carrito.create();
			unCliente.elegirProductos(c);
			t := vCaja.generarTicket(unCliente, c);
			unCliente.cobrar(t, ok);
		end;
end.

