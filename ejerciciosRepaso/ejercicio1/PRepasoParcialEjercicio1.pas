{Ejercicio 1. Una empresa de venta por catálogo desea mantener el historial de ventas de sus
vendedoras. Cada vendedora (identificada por su ID de vendedora) realiza varias ventas y de
cada venta se desea registrar: código de producto vendido, precio unitario (cada vendedora
puede poner su propio precio), cantidad de unidades vendidas y fecha de la venta.
1) Haga un módulo que simule 50 ventas en total repartidas en 10 vendedoras. Las ventas
(generadas al azar) no tienen orden alguno. Almacene las ventas en un ABB ordenado
por ID de vendedora. Para cada vendedora almacene todas sus ventas ordenadas por
código de producto.
2) Haga un módulo que reciba el ABB previamente generado e imprima para cada
vendedora la cantidad total de ventas, la cantidad total de unidades vendidas y el
monto total recaudado.
3) Haga un módulo que reciba el ABB previamente generado y un ID de una vendedora,
recupere las ventas de esa vendedora y almacénelas en otro ABB ordenado por
unidades vendidas.
4) Haga un módulo que reciba el ABB con las ventas de una vendedora (el creado en el
inciso anterior) e imprima toda la información de las ventas cuyas cantidades vendidas
se encuentran entre 5 y 10.
5) Escriba un programa que invoque a los cuatro módulos implementados y compruebe el
correcto funcionamiento del mismo
}


program PRepasoParcialEjercicio1;

uses UABBGenerico;
var i : byte;

procedure simularVentas (var vVendedoras:vectorVendodaras);
var
i:integer;
rg:RandomGenerator;
begin
	for i:=1 to 50
end;
BEGIN
	
	
END.

