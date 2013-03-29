use inc::Module::Install;
use Module::Install::CPANfile;

name 'Net-Signalet';
all_from 'lib/Net/Signalet.pm';

auto_set_repository;
auto_include;
WriteAll;
