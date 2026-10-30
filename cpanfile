use utf8;
use v5.44;

use subs qw'requires recommends on';

requires 'perl', 'v5.44';
requires 'Const::Fast';

use Const::Fast;

sub distname ($pkgname) {
    const my $pkg2dist => qr/::/;
    ( $pkgname =~ s/$pkg2dist/-/rg );
}

const our %pinned => (
    CRABAPP => {
        'Path::Try'          => '0.01_03',
        'IO::Handle::Common' => '0.01_05',
        'IPC::Nosh'          => '0.01_04',
        'Adjust::Params'     => '0.01_03',
    }
);

foreach my ( $author, $modules ) (%pinned) {
    foreach my ( $name, $ver ) (%$modules) {
        requires $name, $ver,
          dist => "$author/" . distname($name) . "-$ver-TRIAL.tar.gz";
    }
}

on 'test' => sub {
    requires 'Test::More', '0.98';
};

requires 'CPAN::Checksums', '2.14';
requires 'CPAN::Mini', '1.111017';
requires 'CPAN::Mini::Inject', '1.012';
requires 'Compress::Bzip2', '2.28';
requires 'Const::Fast', '0.014';
requires 'Dist::Metadata', '0.927';
requires 'Encode::Locale', '1.05';
requires 'File::HomeDir', '1.006';
requires 'JSON::MaybeXS', '1.004008';
requires 'Number::Compare', '0.03';
requires 'Object::Pad', '0.825';
requires 'Syntax::Keyword::Defer', '0.11';
requires 'Syntax::Keyword::Dynamically', '0.14';
requires 'Syntax::Keyword::Try', '0.31';
requires 'URI', '5.35';
requires 'Unicode::UTF8', '0.75';
requires 'Text::Xslate';