unit UProducto;
{$mode objfpc}
interface

	uses sysutils;
	
	type
	
		Producto = class
			private
				descripcion:string;
				peso: real;
			
			public
				constructor create(unaDescripcion:string; unPeso:real);
				function getPeso(): real;
				function getDescripcion(): string;
				function toString(): ansistring; override;
		
		end;
implementation

	constructor Producto.create(unaDescripcion:string; unPeso:real);
	begin
		descripcion:=unaDescripcion; peso:=unPeso;
	end;
	
	function Producto.getPeso(): real;
	begin
	getPeso:=peso;
	end;
	
	function Producto.getDescripcion(): string;
	begin
		getDescripcion:=descripcion;
	end;
	
	function Producto.toString(): ansistring;
	begin
		toString:= format('%10.3f', [peso]);
	end;
end.
