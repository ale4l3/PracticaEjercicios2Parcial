program PTweeter;
uses UTweet;

var 
	primerTweet, respuesta: Tweet;
	user, text: string;
	i: integer;
BEGIN
	writeln('Escribir usuario: '); readln(user);
	writeln('Escribir tweet: '); readln(text);
	primerTweet:= Tweet.create(user,text);
	for i:= 2 to 10 do
	begin
		writeln('Escribir usuario: '); readln(user);
		writeln('Escribir tweet: '); readln(text);
		respuesta:= Tweet.create(user, text);
		primerTweet.agregar(respuesta);
	end;
	primerTweet.imprimir();
END.

