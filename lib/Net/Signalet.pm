package Net::Signalet;
use strict;
use warnings;
our $VERSION = '0.01';

use Carp ();
use IO::Socket::INET;
use Net::IP::Minimal qw(ip_is_ipv4);


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

sub run {
    my ($self, %params) = @_;

    if (!exists $params{command} && !exists $params{code}) {
        Carp::croak "Required command or code";
    }
    my $pid = fork;
    unless ($pid) {
        # child process
        if ($params{command}) {
            exec($params{command});
        }
        elsif ($params{code}) {
            $params{code}->();
        }
    }
    $self->{worker_pid} = $pid if $pid > 0;
}

sub term_worker {
    my ($self) = @_;
    kill('TERM', $self->{worker_pid});
}

sub close {
    my ($self) = @_;
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
