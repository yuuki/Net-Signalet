
requires 'parent';
requires 'Net::IP::Minimal';

on 'test' => sub {
    requires 'Test::More';
    requires 'Test::Fatal';
};
