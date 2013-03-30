
requires 'parent';
requires 'Net::IP::Minimal';
requires 'Term::ANSIColor';

on 'test' => sub {
    requires 'Test::More';
    requires 'Test::SharedFork';
    requires 'Test::Fatal';
};
