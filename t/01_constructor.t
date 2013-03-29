use strict;
use warnings;
use lib 'lib';

use Test::More;

use Net::Signalet::Client;
use Net::Signalet::Server;

subtest normal => sub {
    subtest client => sub {
        my $signalet = Net::Signalet::Client->new(
            daddr => "127.0.0.1",
            saddr => "127.0.0.1",
        );

        if (ok $signalet) {
            isa_ok $signalet, "Net::Signalet::Client";
            isa_ok $signalet->{sock}, "IO::Socket::INET";
        }
    };

    subtest server => sub {
        my $signalet = Net::Signalet::Server->new(
            daddr => "127.0.0.1",
            saddr => "127.0.0.1",
        );

        if (ok $signalet) {
            isa_ok $signalet, "Net::Signalet::Server";
            isa_ok $signalet->{sock}, "IO::Socket::INET";
        }
    };
};

done_testing;
