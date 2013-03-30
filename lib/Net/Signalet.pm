package Net::Signalet;
use strict;
use warnings;
our $VERSION = '0.01';

use Carp ();
use Net::IP::Minimal qw(ip_is_ipv4);
use IO::Socket::INET;


sub _init {
    my ($class, %args) = @_;

    for (qw(saddr daddr)) {
        if (exists $args{$_}) {
            ip_is_ipv4 $args{$_}
                or Carp::croak "$_ is not ipv4: $args{$_}";
        }
    }
}

sub recv {
    my ($self) = @_;
    unless ($self->{sock}) {
        Carp::croak "recv: Not connect";
    }
    $self->{sock}->getline;
}

sub send {
    my ($self, $message) = @_;
    unless ($self->{sock}) {
        Carp::croak "send: Not connect";
    }
    $self->{sock}->print($message);
}

sub service {
    my ($self) = @_;
}

sub run {
    my ($self) = @_;
}

sub close {
    my $self = shift;
    close $self->{sock};
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
