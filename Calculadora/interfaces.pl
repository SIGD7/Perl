#!/usr/bin/perl
use strict;
use warnings;
package interfaces;
use Net::Ifconfig::Wrapper;
use HTML::Template;
use parent 'CGI::Application';
use CGI::Application::Plugin::Forward;

sub setup {
        my $self = shift;
        $self->run_modes(
                'view' => 'showForm',
                'controler' => 'changeIP',
		'suma'	=> 'suma',
		'resta' => 'resta',
		'div'	=> 'div',
		'multi' => 'multi'
        ); 
        $self->start_mode('view');
        $self->mode_param('selector');
}

#sub menu{
#}


sub showForm{
		my $output;
		my $template = HTML::Template->new(filename => './calc.tmpl');
		$output.=$template->output();
		return $output;
}

sub suma{
	my $self = shift;
	my $q = $self -> query(); #revisar
	my $a=$q->param('numero1');
	my $b=$q->param('numero2');
	return $a+$b;
	#return $self->forward('menu');
}


sub resta{
        my $self = shift;
        my $q = $self -> query(); #revisar
        my $a=$q->param('numero1');
        my $b=$q->param('numero2');
        return $a-$b;
        #return $self->forward('menu');
}

sub multi{
        my $self = shift;
        my $q = $self -> query(); #revisar
        my $a=$q->param('numero1');
        my $b=$q->param('numero2');
        return $a*$b;
        #return $self->forward('menu');
}

sub div{
        my $self = shift;
        my $q = $self -> query(); #revisar
        my $a=$q->param('numero1');
        my $b=$q->param('numero2');
	if ($b != 0){
        return $a/$b;
	}else{
	return "No se puede realizar la operacion";
	}
        #return $self->forward('menu');
}



