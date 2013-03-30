use inc::Module::Install;
use Module::Install::CPANfile;

name 'Net-Signalet';
all_from 'lib/Net/Signalet.pm';

install_script 'bin/signalet';
auto_set_repository;
auto_include;
WriteAll;
