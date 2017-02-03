#!/usr/bin/perl

=pod
=head1 Numeros Primos Descripcion
El script genera los numeros primos a partir de la criba de Eratostenes. Se ejecutara el script en la computadora destino y mostrara la salida en pantalla, en donde solo mostrara los numeros primos menores a 50. Ademas al final se mostrara en pantalla una breve explicacion de que es un pragma.
=cut 


$n = 50;  
for ( $i=2; $i<=$n; $i++ ) 
{
	$p[$i] = $i;
}
$k = int( sqrt($n) );
$i=2;
while ( $i <= $k ) 
{
	while ( $p[ $i ] == 0 ) 
	{
		$i ++;
	}
	for ( $j=2; $j<=$n; $j++ ) 
	{
		$a = $i * $j;
		$p[ $a ] = 0;
	}
$i++;
}
for ( $i=1; $i<=$n; $i++ ) 
{
	if ( $p[$i] != 0 ) 
	{
		printf ( "%d\n", $p[$i] );
	}
}

printf("Pragma--> Es un módulo que influye en el tiempo de complación\n o el comportamiento en tiempo de ejecución de un script de perl\n\n");