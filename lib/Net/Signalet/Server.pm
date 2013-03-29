package Net::Signalet::Server;
use strict;
use warnings;

use parent qw(Net::Signalet);


sub new {
    my ($class, @args) = @_;
    my %args = @args == 1 && ref($args[0]) eq 'HASH' ? %{$args[0]} : @args;

    $args{listen} ||= 1;

    $class->SUPER::_new(%args);
}

1;
