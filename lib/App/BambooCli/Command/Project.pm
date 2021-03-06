package App::BambooCli::Command::Project;

# Created on: 2019-06-04 07:54:58
# Create by:  Ivan Wills
# $Id$
# $Revision$, $HeadURL$, $Date$
# $Revision$, $Source$, $Date$

use Moo;
use warnings;
use version;
use Carp;
use Scalar::Util;
use List::Util;
#use List::MoreUtils;
use Data::Dumper qw/Dumper/;
use English qw/ -no_match_vars /;

extends 'App::BambooCli::Command';

our $VERSION = version->new('0.0.1');

our $NAME    = 'plans';
our $OPTIONS = [
    'key|k=s',
    'force|f!',
    'verbose|v+',
];

sub details_sub { return ( $NAME, $OPTIONS )};

sub run {
    my ($self) = @_;
    my $bamboo = $self->config->bamboo;
    my $key = $self->defaults->{key};

    my $project = $bamboo->project($key);
    my @plans = $project->plans;

    my %max = ( key => 1, name => 1, builds => 1 );
    for my $project (@plans) {
        $max{key} = length $project->key if $max{key} < length $project->key;
        $max{name} = length $project->name if $max{name} < length $project->name;
        $max{builds} = length $project->builds if $max{builds} < length $project->builds;
    }
    for my $project (@plans) {
        printf "%-$max{key}s %-$max{name}s (%$max{builds}d) %s\n", $project->key, $project->name, $project->builds, $project->link || '';
    }
}

1;

__END__

=head1 NAME

App::BambooCli::Command::Project - Command to display the information about a single project

=head1 VERSION

This documentation refers to App::BambooCli::Command::Project version 0.0.1

=head1 SYNOPSIS

   use App::BambooCli::Command::Project;

   # Brief but working code example(s) here showing the most common usage(s)
   # This section will be as far as many users bother reading, so make it as
   # educational and exemplary as possible.

=head1 DESCRIPTION

=head1 SUBROUTINES/METHODS

=head2 C<details_sub>

=head2 C<run ()>

=head1 DIAGNOSTICS

=head1 CONFIGURATION AND ENVIRONMENT

=head1 DEPENDENCIES

=head1 INCOMPATIBILITIES

=head1 BUGS AND LIMITATIONS

There are no known bugs in this module.

Please report problems to Ivan Wills (ivan.wills@gmail.com).

Patches are welcome.

=head1 AUTHOR

Ivan Wills - (ivan.wills@gmail.com)

=head1 LICENSE AND COPYRIGHT

Copyright (c) 2019 Ivan Wills (14 Mullion Close, Hornsby Heights, NSW Australia 2077).
All rights reserved.

This module is free software; you can redistribute it and/or modify it under
the same terms as Perl itself. See L<perlartistic>.  This program is
distributed in the hope that it will be useful, but WITHOUT ANY WARRANTY;
without even the implied warranty of MERCHANTABILITY or FITNESS FOR A
PARTICULAR PURPOSE.

=cut
