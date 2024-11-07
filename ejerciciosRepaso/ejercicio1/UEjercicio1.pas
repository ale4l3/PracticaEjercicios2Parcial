{
   UEjercicio1.pas
   
PIZARRON

MiABB = class (ABB)
a:= MiABB.create();
a.agregar(clave,dato)

MiNodo
create (dato)
p:=NgetDato as Productor
p.get
   
   
}


unit UEjercicio1;
{$mode objfpc}

interface
	uses UDateTime, genericLikedList;
	ListaVentas = specialize LinkedList<venta>;
	type
		venta = class
		private
			codigoProducto, cantidad:integer;
			precio:real
			fecha:Date;
		public
		
		end;
		
		vendedora = class
		private
			ID:string;
			ventas:ListaVentas;
		public
			function getID ():string;
		end;
		
		ABBVendedoras = class (ABBGenerico)
			
		
implementation

end;

