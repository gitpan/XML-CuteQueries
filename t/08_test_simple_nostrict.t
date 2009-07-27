
use strict;
use Test;
use XML::CuteQueries;

my $CQ = XML::CuteQueries->new->parse("<r><x><y>7</y></x></r>");

plan tests => 4;

ok( $CQ->cute_query('x/y',''), 7 );
ok( eval{$CQ->cute_query('x/z','')}, undef ) and ok($@, qr(match failed));
ok( $CQ->cute_query({nostrict=>1}, 'x/z',''), undef );