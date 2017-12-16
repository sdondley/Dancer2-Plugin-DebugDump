package Dancer2::Plugin::DebugDump 0.1;

use strict;
use warnings;

use Dancer2::Plugin;
use Data::Dumper qw(Dumper);

plugin_keywords 'ddump';


sub ddump {
  my ($s, @data) = @_;
  my $output = '';
  foreach my $content (@data) {
    if (!ref $content) {
      $content = Dumper $content;
    } elsif (ref $content) {
      $content = Dumper $content;
    }
    $output .= $content;
  }
  $s->dsl->debug("DEBUG DUMP:\n" . $output . "\n");

}


1; # Magic true value required at end of module
__END__

=head1 NAME

Dancer2::Plugin::DebugDump - [Run debug through Dumper for easier reading]


=head1 VERSION

This document describes Dancer2::Plugin::DebugDump version 0.1


=head1 SYNOPSIS

Dancer2's C<debug> keyword prints variables on a single line. This plugin runs variables through C<Data::Dumper> first for output that is easier to read.


=for author to fill in:
    use Dancer2;
    use Dancer2::Plugin::DebugDump;

    ddump($data_structure);
    ddump($data_struture1, $data_structure2, ... );

    # Sample output
    DEBUG DUMP:
    $VAR1 = [
              {
                'key1' => 'value',
                'key2' => 'value'
              },
              {
                'key1' => 'value',
                'key2' => 'value',
              },
            ];


=head1 DESCRIPTION

This simple module provides the keyword C<ddump> used to make debug output easier to read.


=head1 KEYWORDS

== ddump()

Send debug output through Dumper.


=head1 CONFIGURATION

DebugDump requires no configuration files or environment variables.


=head1 DEPENDENCIES

=for author to fill in:
    Data::Dumper;


=head1 INCOMPATIBILITIES

None reported.


=head1 BUGS AND LIMITATIONS

Uses default Data::Dumper settings. Changing these via configuration file may come in a future release.

No bugs have been reported.

Please report any bugs or feature requests to
C<s@dondley.com>, or through the web interface at
L<http://rt.cpan.org>.


=head1 AUTHOR

Steve Dondley  C<< <s@dondley.com> >>


=head1 LICENCE AND COPYRIGHT

Copyright (c) 2017, Steve Dondley C<< <s@dondley.com> >>. All rights reserved.

This module is free software; you can redistribute it and/or
modify it under the same terms as Perl itself. See L<perlartistic>.


=head1 DISCLAIMER OF WARRANTY

BECAUSE THIS SOFTWARE IS LICENSED FREE OF CHARGE, THERE IS NO WARRANTY
FOR THE SOFTWARE, TO THE EXTENT PERMITTED BY APPLICABLE LAW. EXCEPT WHEN
OTHERWISE STATED IN WRITING THE COPYRIGHT HOLDERS AND/OR OTHER PARTIES
PROVIDE THE SOFTWARE "AS IS" WITHOUT WARRANTY OF ANY KIND, EITHER
EXPRESSED OR IMPLIED, INCLUDING, BUT NOT LIMITED TO, THE IMPLIED
WARRANTIES OF MERCHANTABILITY AND FITNESS FOR A PARTICULAR PURPOSE. THE
ENTIRE RISK AS TO THE QUALITY AND PERFORMANCE OF THE SOFTWARE IS WITH
YOU. SHOULD THE SOFTWARE PROVE DEFECTIVE, YOU ASSUME THE COST OF ALL
NECESSARY SERVICING, REPAIR, OR CORRECTION.

IN NO EVENT UNLESS REQUIRED BY APPLICABLE LAW OR AGREED TO IN WRITING
WILL ANY COPYRIGHT HOLDER, OR ANY OTHER PARTY WHO MAY MODIFY AND/OR
REDISTRIBUTE THE SOFTWARE AS PERMITTED BY THE ABOVE LICENCE, BE
LIABLE TO YOU FOR DAMAGES, INCLUDING ANY GENERAL, SPECIAL, INCIDENTAL,
OR CONSEQUENTIAL DAMAGES ARISING OUT OF THE USE OR INABILITY TO USE
THE SOFTWARE (INCLUDING BUT NOT LIMITED TO LOSS OF DATA OR DATA BEING
RENDERED INACCURATE OR LOSSES SUSTAINED BY YOU OR THIRD PARTIES OR A
FAILURE OF THE SOFTWARE TO OPERATE WITH ANY OTHER SOFTWARE), EVEN IF
SUCH HOLDER OR OTHER PARTY HAS BEEN ADVISED OF THE POSSIBILITY OF
SUCH DAMAGES.

