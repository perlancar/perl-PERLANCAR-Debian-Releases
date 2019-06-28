package PERLANCAR::Debian::Releases;

# DATE
# VERSION

use 5.010001;
use strict;
use warnings;

use Perinci::Sub::Gen::AccessTable qw(gen_read_table_func);

use Exporter;
our @ISA = qw(Exporter);
our @EXPORT_OK = qw(
                       list_debian_releases
               );

our %SPEC;

our $meta = {
    summary => 'Debian releases',
    fields => {
        version         => { pos => 0, schema => "str*", sortable => 1, summary => "Version", unique => 1 },
        code_name       => { pos => 1, schema => "str*", sortable => 1, summary => "Code name", unique => 1 },
        reldate         => { pos => 2, schema => "date*", sortable => 1, summary => "Release date" },
        eoldate         => { pos => 3, schema => "date*", sortable => 1, summary => "Supported until" },

        linux_version   => {pos=> 4, schema=>'str*'},

        mysql_version        => {pos=> 5, schema=>'str*'},
        mariadb_version      => {pos=> 6, schema=>'str*'},
        postgresql_version   => {pos=> 7, schema=>'str*'},
        apache_httpd_version => {pos=> 8, schema=>'str*'},
        nginx_version        => {pos=> 9, schema=>'str*'},

        perl_version         => {pos=>10, schema=>'str*'},
        python_version       => {pos=>11, schema=>'str*'},
        php_version          => {pos=>12, schema=>'str*'},
        ruby_version         => {pos=>13, schema=>'str*'},
        bash_version         => {pos=>14, schema=>'str*'},
    },
    pk => "version",
};

our $data = do {
    no warnings 'void';
    [];
# CODE: { require JSON; require File::Slurper; my $json = JSON->new; my $rels = $json->decode(File::Slurper::read_binary("../gudangdata-distrowatch/table/debian_release/data.json")); my $data = []; for my $r (@$rels) { my ($ver, $code) = $r->{release_name} =~ /\A(\d\S*?)([a-z].+)\z/ or do { warn "Can't extract code+ver from release_name '$r->{release_name}', skipped"; next }; push @$data, {version=>$ver, code_name=>$code, reldate=>$r->{release_date}, eoldate=>($r->{eol_date} =~ /\xa0/ ? undef : $r->{eol_date}), linux_version=>$r->{linux_version}, mysql_version=>$r->{mysql_version}, mariadb_version=>$r->{mariadb_version}, postgresql_version=>$r->{postgresql_version}, apache_httpd_version=>$r->{httpd_version}, nginx_version=>$r->{nginx_version}, perl_version=>$r->{perl_version}, python_version=>$r->{python_version}, php_version=>$r->{php_version}, ruby_version=>$r->{ruby_version}, bash_version=>$r->{bash_version} } } $data; }
};

my $res = gen_read_table_func(
    name => 'list_debian_releases',
    table_data => $data,
    table_spec => $meta,
    #langs => ['en_US', 'id_ID'],
);
die "BUG: Can't generate func: $res->[0] - $res->[1]" unless $res->[0] == 200;

1;
# ABSTRACT: List Debian releases

=head1 SYNOPSIS

 use PERLANCAR::Debian::Releases;
 my $res = list_debian_releases(detail=>1);
 # raw data is in $PERLANCAR::Debian::Releases::data;


=head1 DESCRIPTION

This module contains list of Debian releases.

This release is made while waiting for the new release of L<Debian::Releases>
which was promised in 2014 and will contain extra data as well.


=head1 SEE ALSO

L<Ubuntu::Releases>

L<Debian::Releases>

=cut
