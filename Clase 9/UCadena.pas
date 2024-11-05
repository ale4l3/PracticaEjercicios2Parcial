unit UCadena;
{$mode objfpc}
interface

uses UABBGenerico, sysutils;

	type
		Cadena = class (comparable)
	private
		valor: string;
	public
		constructor create(unValor: string); // constructor
		function getValor(): string; // getter
		function toString(): ansistring; override;
		function equals(otroComparable: Comparable): boolean;   override;
		function lessThan(otroComparable: Comparable): boolean;   override;
		function greaterThan(otroComparable: Comparable): boolean;    override;
		function lessThanOrEquals(otroComparable: Comparable): boolean;    override;
		function greaterThanOrEquals(otroComparable: Comparable): boolean;  override;
	end;
implementation
	constructor Cadena.create(unValor: string); // constructor
	begin
		valor:= unValor;
	end;
	function Cadena.getValor(): string; // getter
	begin
		getValor:= valor;
	end;
	function Cadena.toString(): ansistring; 
	begin
		toString:= valor;
	end;
	
	function Cadena.equals(otroComparable: Comparable): boolean;
	{var otraCadena: Cadena;}
	begin
		{otraCadena:= otroComparable as Cadena;
		equals:= valor = otraCadena.getValor();}
		equals:= valor  = (otroComparable as Cadena).getValor();
	end;

	function Cadena.lessThan (otroComparable: Comparable): boolean;
	begin
		lessThan:= valor  < (otroComparable as Cadena).getValor();
	end;

		function Cadena.greaterThan (otroComparable: Comparable): boolean;
	begin
		greaterThan:= valor > (otroComparable as Cadena).getValor();
	end;
	
	function Cadena.lessThanOrEquals(otroComparable: Comparable): boolean; 
	begin
		lessThanOrEquals := valor <=  (otroComparable as Cadena).getValor();
	end;
	
	function Cadena.greaterThanOrEquals(otroComparable: Comparable): boolean;
	begin
		greaterThanOrEquals := valor >=  (otroComparable as Cadena).getValor();
	end;
END.
