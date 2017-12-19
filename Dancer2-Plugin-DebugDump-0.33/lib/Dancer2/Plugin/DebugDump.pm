package Dancer2::Plugin::DebugDump;
$Dancer2::Plugin::DebugDump::VERSION = '0.33';
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

=pod

=head1 NAME

Dancer2::Plugin::DebugDump - Modified debug behavior to create multi-line output that's easier for mere mortals to parse.

=head1 VERSION

version 0.33

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

=for :stopwords cpan testmatrix url annocpan anno bugtracker rt cpants kwalitee diff irc mailto metadata placeholders metacpan

=head1 SUPPORT

=head2 Perldoc

You can find documentation for this module with the perldoc command.

  perldoc Dancer2::Plugin::DebugDump

=head2 Websites

The following websites have more information about this module, and may be of help to you. As always,
in addition to those websites please use your favorite search engine to discover more resources.

=over 4

=item *

MetaCPAN

A modern, open-source CPAN search engine, useful to view POD in HTML format.

L<https://metacpan.org/release/Dancer2-Plugin-DebugDump>

=back

=head2 Bugs / Feature Requests

Please report any bugs or feature requests by email to C<bug-dancer2-plugin-debugdump at rt.cpan.org>, or through
the web interface at L<https://rt.cpan.org/Public/Bug/Report.html?Queue=Dancer2-Plugin-DebugDump>. You will be automatically notified of any
progress on the request by the system.

=head2 Source Code

The code is open to the world, and available for you to hack on. Please feel free to browse it and play
with it, or whatever. If you want to contribute patches, please send me a diff or prod me to pull
from your repository :)

L<https://github.com/sdondley/Dancer2-Plugin-DebugDump>

  git clone git://github.com/sdondley/Dancer2-Plugin-DebugDump.git

=head1 BUGS AND LIMITATIONS

You can make new bug reports, and view existing ones, through the
web interface at L<http://github.com/sdondley/Dancer2-Plugin-DebugDump/issues>.

=head1 HOMEPAGE

Please visit the project's homepage at L<https://metacpan.org/release/Dancer2-Plugin-DebugDump>.

=head1 SOURCE

The development version is on github at L<https://github.com/sdondley/Dancer2-Plugin-DebugDump>
and may be cloned from L<git://github.com/sdondley/Dancer2-Plugin-DebugDump.git>

=head1 INSTALLATION

See perlmodinstall for information and options on installing Perl modules.

=head1 AUTHOR

Steve Dondley <s@dondley.com>

=head1 COPYRIGHT AND LICENSE

This software is copyright (c) 2017 by Steve Dondley.

This is free software; you can redistribute it and/or modify it under
the same terms as the Perl 5 programming language system itself.

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

=cut

__END__
# ABSTRACT: Modified debug behavior to create multi-line output that's easier for mere mortals to parse.

