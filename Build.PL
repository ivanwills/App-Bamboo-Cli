use strict;
use warnings;
use Module::Build;

my $builder = Module::Build->new(
    module_name       => 'App-Bamboo-Cli',
    license           => 'perl',
    dist_author       => 'Ivan Wills <ivan.wills@gmail.com>',
    dist_version_from => 'lib/App-Bamboo-Cli.pm',
    requires          => {
        'perl'        => 5.008,
        'Net::Bamboo' => 0,
    },
    build_requires => {
        'Test::More'     => 0,
        'Test::Warnings' => 0,
    },
    add_to_cleanup     => [ 'App-Bamboo-Cli-*' ],
    create_license     => 1,
    meta_merge => {
        resources => {
            repository => 'git://github.com/ivanwills/App-Bamboo-Cli.git',
            bugtracker => 'http://rt.cpan.org/NoAuth/Bugs.html?Dist=App-Bamboo-Cli',
        },
    },
);

$builder->create_build_script();
