unit UCarrito;
{$mode objfpc}
interface
	uses GenericLinkedList, UProducto;	
	type
	p = specialize LinkedList<Producto>;
	Carrito = Class
	private
	productos : p;
	cantidadDeProductos:integer;
	public
	constructor create();
	procedure agregarProducto(unProducto:Producto);
	function sacarProducto():Producto;
	function cuantosProductosTenes():integer;
	end;
	
implementation

	constructor Carrito.create();
	begin
	productos:= productos.create();
	cantidadDeProductos := 0;
	end;
	
	procedure Carrito.agregarProducto(unProducto:Producto);
	begin
		productos.add(unProducto);
		cantidadDeProductos:= cantidadDeProductos + 1;
	end;
	
	function Carrito.sacarProducto():Producto;
	begin
		productos.reset();
		sacarProducto:= productos.current();
		productos.removeCurrent();
	end;
	
	
	function Carrito.cuantosProductosTenes():integer;
	begin
		cuantosProductosTenes:= cantidadDeProductos;
	end;

END.

