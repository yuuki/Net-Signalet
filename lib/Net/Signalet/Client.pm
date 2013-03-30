package Net::Signalet::Client;
use strict;
use warnings;

use parent qw(Net::Signalet);

use Carp();

sub new {
    my ($class, @args) = @_;
    my %args = @args == 1 && ref($args[0]) eq 'HASH' ? %{$args[0]} : @args;

    $class->SUPER::_init(%args);

    my $sock = IO::Socket::INET->new(
        Proto     => 'tcp',
        PeerAddr  => $args{daddr},
        PeerPort  => $args{dport}   || 14550,
        LocalAddr => $args{saddr}   || undef,
        LocalPort => $args{sport}   || undef,
        Timeout   => $args{timeout} || 5,
    ) or Carp::croak "Can't connect to server: $!";

    return bless { sock => $sock }, $class;
}

1;
