package Dancer2::Plugin::DebugDump;

use strict;
use warnings;

use Dancer2::Plugin;
use Data::Dumper qw(Dumper);

plugin_keywords 'ddump';

sub ddump {
  my ($s, @data) = @_;
  my $output = '';
  foreach my $content (@data) {
    $output .= Dumper $content;
  }
  $s->dsl->debug("DEBUG DUMP:\n" . $output . "\n");
}

1; # Magic true value required at end of module
__END__
# ABSTRACT: Modified debug behavior to create multi-line output that's easier for mere mortals to parse.

=head1 NAME

Dancer2::Plugin::DebugDump - Modifies debug behavior to create multi-line output that's easier for mere mortals to parse.

=head1 OVERVIEW

L<Dancer2::Plugin::DebugDump>, is a simple plugin for the [Dancer2](http://perldancer.org/) web application framework. The target audience for this software is Dancer2 developers that use Dancer2's `debug` keyword during software development. It's purpose is to make the `debug` output in the log files or console easier to discern by formatting it across several lines.

=head1 SYNOPSIS

By default, Dancer2's C<debug> keyword outputs data structures to a single line. This plugin runs variables through C<Data::Dumper> to produce output that is easier to read.

    use Dancer2;
    use Dancer2::Plugin::DebugDump;

    my $data_stucture = [ { 'key1' => 'value', 'key2' => 'value' }, { 'key1' => 'value' , 'key2' => 'value' } ];
    ddump($data_structure);

    # Sample output to your log or console
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

    # Accepts multiple arguments, each argument should be a scalar or a reference
    ddump($data_structure, $scalar_var, \@array_var, \%hash_var, ... );

=head1 KEYWORDS

=head2 ddump

Accepts list of scalars and references which are processed through Dumper before getting sent to Dancer2's built-in C<debug> keyword. See Synopsis for usaage.

=head1 CONFIGURATION

DebugDump requires no configuration files or environment variables.

=head1 DEPENDENCIES

L<Data::Dumper>;

=head1 INCOMPATIBILITIES

None reported.

=head1 MOTIVATION

I'm new to Dancer2 development and wrote this plugin to scratch a minor itch and to learn how to write a basic Dancer2 module. It's also my first CPAN module.

=head1 DEVELOPMENT NOTES

This software is actively maintained. Further releases are expected to help exercise my budding software development skills. Feedback, suggestions, and contributions are greatly appreciated and welcome.

I'm ignorant as to whether there is a better way to solve this problem than with a plugin. If there is a simpler, more elegant solution, I'm happy to hear it and will deprecate this module.

=head1 SEE ALSO

L<Data::Dumper> man page.
L<Dancer2> man page.
L<Dancer2::Plugin> man page.

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

