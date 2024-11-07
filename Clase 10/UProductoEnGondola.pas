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
{$mode objfpc}

interface
	uses UProducto;
	type
	
	ProductoEnGondola = class
	private
		nombre:string;
		precioKilo:real;
		stock:real;
		
	public
		
		constructor create(unProducto: string; unPrecio: real; unStock: real); // constructor
		function getPrecio(): real; // getter
		function getNombre():string;
		procedure setPrecio(unPrecio: real); // setter
		function getStock(): real; // getter
		procedure setStock(unStock: real); // setter
		function toString(): ansistring; override;
		
	end;
	
implementation
	
		constructor ProductoEnGondola.create(unProducto: string; unPrecio: real; unStock: real); // constructor
		begin
			nombre:=unProducto;
			precioKilo:=unPrecio;
			stock:=unStock;
		end;
		
		function ProductoEnGondola.getPrecio(): real; // getter
		begin
			getPrecio:=precioKilo;
		end;
		
		procedure ProductoEnGondola.setPrecio(unPrecio: real); // setter
		begin
			precioKilo:=unPrecio;
		end;
		function ProductoEnGondola.getNombre():string;
		begin
			getNombre:=nombre;
		end;
		function ProductoEnGondola.getStock(): real; // getter
		begin
			getStock:=stock;
		end;
		
		procedure ProductoEnGondola.setStock(unStock: real); // setter
		begin
			stock:=unStock;
		end;
		
		function ProductoEnGondola.toString(): ansistring;
		begin
			toString:=nombre;
		end;

end.

