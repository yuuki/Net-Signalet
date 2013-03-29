package Net::Signalet;
use strict;
use warnings;
our $VERSION = '0.01';

use Carp ();
use Net::IP::Minimal qw(ip_is_ipv4);
use IO::Socket::INET;


sub _new {
    my ($class, %args) = @_;

    for (qw(saddr daddr)) {
        if (exists $args{$_}) {
            ip_is_ipv4 $args{$_}
                or Carp::croak "$_ is not ipv4: $args{$_}";
        }
    }

    my $sock = IO::Socket::INET->new(
        PeerAddr  => $args{daddr},
        PeerPort  => $args{dport}  || 14550,
        Proto     => 'tcp',
        LocalAddr => $args{saddr}  || undef,
        Listen    => $args{listen} || undef,
    ) or die "Can't connect to server: $!";

    my $self = bless { sock => $sock }, $class;
    return $self;
}

sub recv {
    my $self = shift;
}

sub send {
    my $self = shift;
}

sub run {
    my $self = shift;
}

1;
__END__

=head1 NAME

Net::Signalet -

=head1 SYNOPSIS

  use Net::Signalet;

=head1 DESCRIPTION

Net::Signalet is

=head1 AUTHOR

Yuuki Tsubouchi E<lt>yuuki@cpan.orgE<gt>

=head1 SEE ALSO

=head1 LICENSE

This library is free software; you can redistribute it and/or modify
it under the same terms as Perl itself.

=cut
