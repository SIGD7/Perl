#!/usr/bin/perl
use strict;
use 5.014;
use Data::Dumper;

=pod
 
=head1 DESCRIPCION
A partir de un archivo de texto pasado como argumento para el script, se procesará e indicará las coincidencias por medio de expresiones regulares, las cuales deberán entregar:
IPS
Emails
Dominios
URLS
 
Ej para ejecución:
perl 02_SGalindo_Tarea.pl <datos.txt>
=cut


my $file = $ARGV[0];
my %ips;
my $ip;
my $numip;

my %emails;
my $email;
my $numemail;

my %domainNames;
my $domainName;
my $numdomainName;

my %urls;
my $url;
my $numurl;

	open(PASS, '<', $file);
	open(RES, "> resultado.txt");
	print "Procesando archivo '$file'\n";

	while(<PASS>)
		{
			chomp;

			if ($_ =~ /([a-zA-Z0-9-]+)([a-zA-Z0-9-]+)@([a-zA-Z0-9-]+)[.]*([a-zA-Z0-9-]*)[.]*([a-zA-Z0-9-]*)/)
			{
			 	$email = ($&)[0];
			   $emails{$email}++;
			   $numemail++;
			}

			if ($_ =~/(?:(?:25[0-5]|2[0-4][0-9]|[01]?[0-9][0-9]?).){3}(?:25[0-5]|2[0-4][0-9]|[01]?[0-9][0-9]?)/)
			{
				$ip = ($&)[0];
				$ips{$ip}++;
				$numip++;
			}

			if ($_ =~/([a-z0-9]+(-[a-z0-9]+)*\.)+[a-z]{2,}[^.jpg]$/) 
			{
			 	$domainName = ($&)[0];
			 	$domainNames{$domainName}++;
			 	$numdomainName++;
			}

			if ($_ =~/(((http|ftp|https|www|sftp):\/{2})+(([0-9a-z_-]+\.)+(.*)(:[0-9]+)?((\/([~0-9a-zA-Z\#\+\%@\.\/_-]+))?(\?[0-9a-zA-Z\+\%@\/&\[\];=_-]+)?)?))\b/)
			{
			  	$url = ($&)[0];
			  	$urls{$url}++;
			  	$numurl++;
			}
		}

#		print Dumper \%ips;
		say RES"\nNumero total de ips: '$numip'";
#		print scalar(keys %ips),"\n";
#		print Dumper \%emails;
		say RES"\nNumero total de emails: '$numemail'" ;
#		print scalar(keys %emails),"\n";
#		print Dumper \%domainNames;
		say RES"\nNumero total de nombres de dominio: '$numdomainName'";
#		print scalar(keys %domainNames),"\n";
#		print Dumper \%urls;
		say RES"\nNumero total de urls: '$numurl'";
#		print scalar(keys %urls),"\n";
close PASS;
close RES;