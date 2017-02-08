#!/usr/bin/perl
use warnings;
use strict;
use Switch;

my $var1;
my $var2;
my $opc;



sub suma()
{
    
    print $_[0] + $_[1];
}
sub resta()
{
    print $_[0] - $_[1];
}
sub multiplicacion()
{
    print $_[0] * $_[1];
}
sub division()
{
	if($_[1] > 0){
		print $_[0] / $_[1];

	}
	else {
		print "No hay division entre cero";
	}
  }

sub menu()
{
	
	print "que deseas hacer";
	print "\n\n1.- Suma";
	print "\n2.- Resta";
	print "\n3.- Multiplicacion";
	print "\n4.- Division";
	print "\n--> ";
	chomp ($opc = <STDIN>);
	chomp ($var1 = <STDIN>);
    chomp ($var2 = <STDIN>);
		   

	switch($opc){
		case 1{
			 &suma($var1,$var2);
			 print"\n";
		}
			
		case 2{
		    &resta($var1,$var2);
		    print"\n";
		}
			
		case 3{
			&multiplicacion($var1,$var2);
			print"\n";
		}
			
	
		case 4{
			&division($var1,$var2);
			print"\n";

		}
		else {
			print "debes introducir una opcion valida\n";
		}

		}	
}

&menu();