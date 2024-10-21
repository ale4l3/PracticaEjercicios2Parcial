unit UCaja;
{$mode objfpc}
{
Modifique el programa de la actividad 2 para realizar las modificaciones pedidas en esta actividad.
 Implemente un módulo que pase todos los productos del carrito (información recolectada en el módulo CargarCarrito) por la balanza y
calcule el total a pagar. Los precios por kilo de cada producto puede ser elegido al azar. Este módulo debe generar un ticket de compra con la siguiente información:
○ hora y dia (al azar entre el 1/9/2024 y el 30/9/2024)
○ nombre del cliente (un string al azar)
○ monto total a pagar (calculado con la balanza)
○ nombre de los productos comprados y sus respectivos pesos (información generada en el módulo CargarCarrito).
}
interface

	uses UBalanza, UCliente, UCarrito, UTicket, URandomGenerator, UDateTime;
	
	type
	
		Caja = Class
			private
				numero: integer;
				cBalanza: Balanza;
			public
				constructor create();
				function generarTicket(unCliente: Cliente; unCarrito: Carrito): Ticket;
		end;
	
implementation
		constructor Caja.create();
		begin
			randomize;
			numero:= random(100) +1 ;
			cBalanza:= Balanza.create();
		end;
		
		function Caja.generarTicket(unCliente: Cliente; unCarrito: Carrito): Ticket;
			var
				precio : real;
				rg : RandomGenerator;
				i:integer;
				d1,d2: Date; 
				t1,t2: Time;
				t: Ticket;
			begin
				rg := RandomGenerator.create;
				d1:= Date.create(1, 9, 2024); 
				d2:= Date.create(30, 9, 2024);
				t1:= Time.create(7, 00, 00); 
				t2:= Time.create(20,00, 00);
				t := Ticket.create(rg.getTime(t1, t2), rg.getDate(d1, d2));
				t.setCliente(unCliente.getNombre);
				for i:=1 to unCarrito.cuantosProductosTenes() do begin
					precio := rg.getReal(1,100);
					cBalanza.setPrecioPorKilo(precio);
					cBalanza.pesar(unCarrito.getCurrentProducto().getPeso());
				end;
				t.setTotalAPagar(cBalanza.getTotalAPagar());
				generarTicket:=t;
			end;
	
end.

