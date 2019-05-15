#!/usr/bin/perl

use strict;
use warnings;
use Test::More;
use Test::Warnings;

BEGIN {
    use_ok( 'App-Bamboo-Cli' );
}

diag( "Testing App-Bamboo-Cli $App-Bamboo-Cli::VERSION, Perl $], $^X" );
done_testing();
