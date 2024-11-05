unit UTweet;
{$mode objfpc}
interface
	type
		Tweet = class
			private
				usuario, texto: string;
				respuesta: Tweet;
				soyElUltimo: boolean;
			public
				constructor create(unUser, unTexto: string);		
				procedure agregar(unaRespuesta: Tweet);
				procedure imprimir();
		end;

implementation 
	
	constructor Tweet.create(unUser, unTexto: string);
	begin
		usuario:= unUser;
		texto:= unTexto;
		soyElUltimo:= true;
	end;
	
	procedure Tweet.agregar(unaRespuesta: Tweet);
	begin
		if soyElUltimo then
		begin
			respuesta:= unaRespuesta;
			soyElUltimo:= false;
		end
		else
			respuesta.agregar(unaRespuesta);
	end;
	
	procedure Tweet.imprimir();
	begin
		writeln(usuario + ': ' + texto);
		if not soyElUltimo then
			respuesta.imprimir();
	end;
	

end.
