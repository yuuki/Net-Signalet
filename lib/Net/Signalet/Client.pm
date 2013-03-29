package Net::Signalet::Client;
use strict;
use warnings;

use parent qw(Net::Signalet);


sub new {
    my ($class, @args) = @_;
    my %args = @args == 1 && ref($args[0]) eq 'HASH' ? %{$args[0]} : @args;

    $class->SUPER::_new(%args);
}

1;
