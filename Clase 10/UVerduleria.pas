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

	uses UCaja, UCajaDeAhorro, UCliente, UCarrito, UTicket, genericlinkedlist, UProducto, UDateTime, UTransferencia, URandomGenerator,UProductoEnGondola,UABBGenerico, UCadena;
	
	type
	
		Verduleria = Class
			private
				nombre: string;
				vCaja: Caja;
				vCuenta:CajaDeAhorro;
				gondola:ABBGenerico;
			public
				constructor create(unNombre: string; unaCajaAhorro: CajaDeAhorro);
				
				procedure atender(unCliente: Cliente);
				procedure crearProductoEnGondola(unaEtiqueta:string;unPrecio:real;unStock:real);
		end;
	
implementation	
	
		constructor Verduleria.create(unNombre: string; unaCajaAhorro: CajaDeAhorro);
			begin
				nombre:=unNombre;
				vCaja:= Caja.create();
				vCuenta:=unaCajaAhorro;
				gondola:= ABBGenerico.create;
			end;
			
		procedure Verduleria.atender(unCliente: Cliente);
		var
			unCarrito:Carrito;
			unTicket:Ticket;
			unaTransferencia: Transferencia;
			ok:boolean;
		begin
			unCarrito := Carrito.create();
			unCliente.elegirProductos(unCarrito,gondola);
			unTicket := vCaja.generarTicket(unCliente, unCarrito, gondola);
			unaTransferencia:= Transferencia.create(vCuenta);
			unCliente.cobrar(unTicket, unaTransferencia, ok);
		end;
		
		procedure Verduleria.crearProductoEnGondola(unaEtiqueta:string;unPrecio:real;unStock:real);
		begin
			gondola.agregar(Cadena.create(unaEtiqueta),ProductoEnGondola.create(unaEtiqueta, unPrecio, unStock)); //Encapsulo el string en un objeto de clase Cadena para que sea de tipo comparable 
					
		end;
end.

