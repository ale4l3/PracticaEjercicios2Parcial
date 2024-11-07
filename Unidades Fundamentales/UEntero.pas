unit UEntero;
{$mode objfpc}

interface

uses UABBGenerico, sysutils;

	type
		Entero = class (comparable)
	private
		valor: integer;
	public
		constructor create(unValor: integer); // constructor
		function getValor(): integer; // getter
		function toString(): ansistring; override;
		function equals(otroComparable: Comparable): boolean;   override;
		function lessThan(otroComparable: Comparable): boolean;   override;
		function greaterThan(otroComparable: Comparable): boolean;    override;
		function lessThanOrEquals(otroComparable: Comparable): boolean;    override;
		function greaterThanOrEquals(otroComparable: Comparable): boolean;  override;
	end;
	
implementation

	constructor Entero.create(unValor: integer); // constructor
	begin
		valor:= unValor;
	end;
	
	function Entero.getValor(): integer; // getter
	begin
		getValor:= valor;
	end;
	
	function Entero.toString(): ansistring; 
	begin
		toString:= format('%10.3f', [valor]);
	end;
	
	function Entero.equals(otroComparable: Comparable): boolean;
	{var otraCadena: Cadena;}
	begin
		{otraCadena:= otroComparable as Cadena;
		equals:= valor = otraCadena.getValor();}
		equals:= valor  = (otroComparable as Entero).getValor();
	end;

	function Entero.lessThan (otroComparable: Comparable): boolean;
	begin
		lessThan:= valor  < (otroComparable as Entero).getValor();
	end;

	function Entero.greaterThan (otroComparable: Comparable): boolean;
	begin
		greaterThan:= valor > (otroComparable as Entero).getValor();
	end;
	
	function Entero.lessThanOrEquals(otroComparable: Comparable): boolean; 
	begin
		lessThanOrEquals := valor <=  (otroComparable as Entero).getValor();
	end;
	
	function Entero.greaterThanOrEquals(otroComparable: Comparable): boolean;
	begin
		greaterThanOrEquals := valor >=  (otroComparable as Entero).getValor();
	end;
	
END.
