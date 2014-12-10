package App::hr;

our $DATE = '2014-12-10'; # DATE
our $VERSION = '0.01'; # VERSION

use 5.010001;
use strict;
use warnings;

use Exporter;
our @ISA = qw(Exporter);
our @EXPORT_OK = qw(
                       hr
               );

my $o;

sub hr {
    my $char = shift;
    $char  = "=" if !defined($char) || !length($char);
    my $w  = $o->term_width;
    my $n  = int($w / length($char))+1;
    my $hr = substr(($char x $n), 0, $w);
    return $hr if defined(wantarray);
    if ($^O =~ /MSWin/) {
        substr($hr, -1, 1) = '';
    }
    say $hr;
}

# a dummy class just to use TermAttrs
{
    package # hide from PAUSE
        App::hr::Class;
    use Moo;
    with 'Term::App::Role::Attrs';
}
$o = App::hr::Class->new;

1;
# ABSTRACT: Print horizontal bar on the terminal

__END__

=pod

=encoding UTF-8

=head1 NAME

App::hr - Print horizontal bar on the terminal

=head1 VERSION

This document describes version 0.01 of App::hr (from Perl distribution App-hr), released on 2014-12-10.

=head1 SYNOPSIS

 use App::hr qw(hr);
 hr;

Sample output:

 =============================================================================

 hr('x----');

Sample output:

 x----x----x----x----x----x----x----x----x----x----x----x----x----x----x----x-

You can also use the provided CLI L<hr>.

=head1 FUNCTIONS

=head2 hr([CHAR]) => optional STR

Print (under void context) or return (under scalar/array context) a horizontal
ruler with the width of the terminal.

C<CHAR> is optional, can be multicharacter, but cannot be empty string. The
defautl is C<=>.

Under Windows, when printing, will shave one character at the end because the
terminal cursor will move a line down when printing at the last column.

Terminal width is currently determined using L<Term::App::Role::Attrs>, which
will either use environment variable C<COLUMNS> or detecting using
L<Term::Size>, or if all those fail, use a hard-coded default of 80.

=head1 HOMEPAGE

Please visit the project's homepage at L<https://metacpan.org/release/App-hr>.

=head1 SOURCE

Source repository is at L<https://github.com/perlancar/perl-App-hr>.

=head1 BUGS

Please report any bugs or feature requests on the bugtracker website L<https://rt.cpan.org/Public/Dist/Display.html?Name=App-hr>

When submitting a bug or request, please include a test-file or a
patch to an existing test-file that illustrates the bug or desired
feature.

=head1 AUTHOR

perlancar <perlancar@cpan.org>

=head1 COPYRIGHT AND LICENSE

This software is copyright (c) 2014 by perlancar@cpan.org.

This is free software; you can redistribute it and/or modify it under
the same terms as the Perl 5 programming language system itself.

=cut
