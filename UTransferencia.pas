{

   
+ create(unDestino: CajaDeAhorro)
+ transferir(unOrigen: CajaDeAhorro; unMonto: real; var ok: boolean);
}
unit UTransferencia;
{$mode objfpc}
interface
	uses UCajaDeAhorro;
	type
		Transferencia = class
			private
				cajaDestino:CajaDeAhorro;
			public
				constructor create(var unDestino: CajaDeAhorro);
				procedure transferir(unOrigen: CajaDeAhorro; unMonto: real; var ok: boolean);
		end;
		
implementation

			constructor Transferencia.create(var unDestino: CajaDeAhorro);
			begin
				cajaDestino:=unDestino;
			end;
			
			procedure Transferencia.transferir(unOrigen: CajaDeAhorro; unMonto: real; var ok: boolean);
			begin	
				unOrigen.extraer(unMonto,ok);
				if ok then
					cajaDestino.depositar(unMonto);
			end;
end.

