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

	uses UBalanza, UCliente, UCarrito, UTicket, URandomGenerator, UDateTime, UProducto,UProductoEnGondola,UABBGenerico, UCadena;
	
	type
	
		Caja = Class
			private
				numero: integer;
				cBalanza: Balanza;
			public
				constructor create();
				function generarTicket(unCliente: Cliente; unCarrito: Carrito; gondola:ABBGenerico): Ticket;
		end;
	
implementation
		constructor Caja.create();
		begin
			randomize;
			numero:= random(100) +1 ;
			cBalanza:= Balanza.create();
		end;
		
		function Caja.generarTicket(unCliente: Cliente; unCarrito: Carrito; gondola:ABBGenerico): Ticket; //MODIFIQUE PARA SACAR EL PRECIO DE GONDOLA
			var
				rg : RandomGenerator;
				d1,d2: Date; 
				t1,t2: Time;
				t: Ticket;
				p:producto;
				productoGondola:TObject;
				existe:boolean;
			begin
				rg := RandomGenerator.create;
				d1:= Date.create(1, 9, 2024); 
				d2:= Date.create(30, 9, 2024);
				t1:= Time.create(7, 00, 00); 
				t2:= Time.create(20,00, 00);
				t := Ticket.create(rg.getTime(t1, t2), rg.getDate(d1, d2));
				t.setCliente(unCliente.getNombre());
				while unCarrito.cuantosProductosTenes() > 0 do begin
					p:=unCarrito.sacarProducto();
					gondola.buscarElemento(Cadena.create(p.getDescripcion), productoGondola, existe);
					if existe then 
						cBalanza.setPrecioPorKilo(ProductoEnGondola(productoGondola).getPrecio);
					cBalanza.pesar (p.getPeso());
					t.agregarProducto(p);
				end;
				t.setTotalAPagar(cBalanza.getTotalAPagar());
				cBalanza.limpiar();
				generarTicket:=t;
			end;
	
end.

