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
				constructor create(unDestino: CajaDeAhorro);
				procedure transferir(unOrigen: CajaDeAhorro; unMonto: real; var ok: boolean);
		end;
		
implementation

			constructor Transferencia.create(unDestino: CajaDeAhorro);
			begin
				cajaDestino:=unDestino;
			end;
			
			procedure Transferencia.transferir(unOrigen: CajaDeAhorro; unMonto: real; var ok: boolean);
			begin	
				unOrigen.extraer(unMonto,ok);

				if ok then begin
				writeln (':::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::');
				writeln ('');
				writeln('CUENTA: ',  unOrigen.getNumero, '. MONTO FINAL: ', unOrigen.consultarSaldo():2:0);
				writeln ('');
				writeln (':::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::');
				cajaDestino.depositar(unMonto);
				writeln (':::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::');
				writeln ('');
				writeln('CUENTA DESTINO: ',  cajaDestino.getNumero, '. MONTO: ', cajaDestino.consultarSaldo():2:0);
				writeln ('');
				writeln (':::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::');
				end;
			end;
end.

