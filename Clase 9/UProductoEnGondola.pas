{ACTIVIDAD 6: Cree el archivo UProductoEnGondola.pas
Cree el objeto ProductoEnGondola para contar con un objeto que represente
los productos de la verdulería que están en la góndola.
Esta clase debe tener un nombre descriptivo, un precio por kilo y un stock en
kilos.
• create(unProducto: string; unPrecio: real; unStock: real) // constructor
• getPrecio(): real // getter
• setPrecio(unPrecio: real) // setter
• getStock(): real // getter
• setStock(unStock: real) // setter
• toString(): string // devuelve una representación del objeto en
// formato string}
unit  UProductoEnGondola;
uses UProducto;
interface

	ProductoEnGondola = class
	private
		nombre:string;
		precioKilo:real;
		stock:real;
		
	public
		
		constructor create(unProducto: string; unPrecio: real; unStock: real); // constructor
		function getPrecio(): real; // getter
		procedure setPrecio(unPrecio: real); // setter
		function getStock(): real; // getter
		procedure setStock(unStock: real); // setter
		function toString(): string ;
		
	end;
	
implementation
	
		constructor ProductoEnGondola.create(unProducto: string; unPrecio: real; unStock: real); // constructor
		begin
			
		end;
		
		function ProductoEnGondola.getPrecio(): real; // getter
		begin
			
		end;
		
		procedure ProductoEnGondola.setPrecio(unPrecio: real); // setter
		begin
			
		end;
		
		function ProductoEnGondola.getStock(): real; // getter
		begin
			
		end;
		
		procedure ProductoEnGondola.setStock(unStock: real); // setter
		begin
			
		end;
		
		function ProductoEnGondola.toString(): string;
		begin
			
		end;

end.

