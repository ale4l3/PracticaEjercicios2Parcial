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
	uses UBalanza, UCliente, UCarrito, UTicket;
	type
		Caja = Class
		private
		numero:integer;
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
		begin
		
		end;
	
END.

