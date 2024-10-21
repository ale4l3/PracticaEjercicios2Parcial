unit UCaja;
{$mode objfpc}
{
Modifique el programa de la actividad 2 para realizar las modificaciones pedidas en esta actividad.
● Implemente un módulo que pase todos los productos del carrito (información recolectada en el módulo CargarCarrito) por la balanza y
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
		balanza: Balanza;
		public
		constructor create();
		function generarTicket(unCliente: Cliente; unCarrito: Carrito): Ticket;
	end;
	
implementation
		constructor Caja.create();
		begin
		randomize;
		numero:= random(100) +1 ;
		end;
		
		function Caja.generarTicket(unCliente: Cliente; unCarrito: Carrito): Ticket;
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
				for i:=1 to unCarrito.cuantosProductosTenes() do begin
					precio := rg.getReal(1,100);
					b.setPrecioPorKilo(precio);
					b.pesar(unCarrito.getCurrentProducto().getPeso());
				end;
				d1:= Date.create(1, 9, 2024); 
				d2:= Date.create(30, 9, 2024);
				t1:= Time.create(7, 00, 00); 
				t2:= Time.create(20,00, 00);
				generarTicket.create(rg.getTime(t1, t2), rg.getDate(d1, d2));
				generarTicket.setTotalAPagar(b.getTotalAPagar());
				generarTicket.setCliente(unCliente.getNombre);
			end;
	
end.

