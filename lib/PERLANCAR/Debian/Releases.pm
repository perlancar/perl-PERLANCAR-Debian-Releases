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

# BEGIN FRAGMENT id=meta
# note: This section is generated by a script. Do not edit manually!
# src-file: /zpool_host_mnt/mnt/home/s1/repos/gudangdata/table/debian_release/meta.yaml
# src-revision: 5759af125cce118c0913b7d3e3a06b430de0ea49
# revision-date: Tue Sep 22 19:39:29 2015 +0700
# generate-date: Tue Jan 17 19:04:21 2017
# generated-by: /zpool_host_mnt/mnt/home/s1/repos/gudangdata/bin/gen-perl-meta-snippet
our $meta = {
  fields => {
    code_name     => { pos => 1, schema => "str*", sortable => 1, summary => "Code name", unique => 1 },
    eoldate       => { pos => 3, schema => "date*", sortable => 1, summary => "End of life date" },
    kernelver     => { pos => 6, schema => "str*", sortable => 1, summary => "Kernel version" },
    lprel_reldate => {
                       pos => 5,
                       schema => "date*",
                       sortable => 1,
                       summary => "Latest point release date",
                     },
    lprel_version => {
                       pos => 4,
                       schema => "str*",
                       sortable => 1,
                       summary => "Latest point release version",
                     },
    perlver       => { pos => 7, schema => "str*", sortable => 1, summary => "Perl version" },
    reldate       => { pos => 2, schema => "date*", sortable => 1, summary => "Release date" },
    version       => { pos => 0, schema => "str*", sortable => 1, summary => "Version", unique => 1 },
  },
  pk => "version",
  summary => "Debian releases",
};
# END FRAGMENT id=meta
# BEGIN FRAGMENT id=data
# note: This section is generated by a script. Do not edit manually!
# src-file: /zpool_host_mnt/mnt/home/s1/repos/gudangdata/table/debian_release/data.csv
# src-revision: e48fb21e3019f8a6010ef209ac65a93368861f4e
# revision-date: Tue Jan 17 19:01:58 2017 +0700
# generate-date: Tue Jan 17 19:04:21 2017
# generated-by: /zpool_host_mnt/mnt/home/s1/repos/gudangdata/bin/gen-perl-data-snippet
our $data = [
    ['1.1','buzz','1996-06-17','','','','2.0.0','5.002'],
    ['1.2','rex','1996-12-12','','','','2.0.23','5.00307'],
    ['1.3','bo','1997-06-05','','','','2.0.33','5.00307'],
    ['2.0','hamm','1998-07-24','','','','2.0.34','5.00404'],
    ['2.1','slink','1999-03-09','2000-10-30','','','2.0.36','5.00404'],
    ['2.2','potato','2000-08-15','2003-06-30','','','2.2.19','5.00503'],
    ['3.0','woody','2002-07-19','2006-06-30','','','2.2.20','5.6.1'],
    ['3.1','sarge','2005-06-06','2008-03-31','','','2.4.27','5.8.4'],
    ['4.0','etch','2007-04-08','2010-02-15','','','2.6.18','5.8.8'],
    ['5.0','lenny','2009-02-14','2012-02-06','','','2.6.26','5.10.0'],
    ['6.0','squeeze','2011-02-06','2016-02-28','6.0.10','2014-07-19','2.6.32','5.10.1'],
    ['7.0','wheezy','2013-05-04','','7.9.0','2015-09-05','3.2.0','5.14.2'],
    ['8.0','jessie','2015-04-25','','8.2.0','2015-09-05','3.16.0','5.20.2'],
]
;
# END FRAGMENT id=data

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

This module contains list of Debian releases. Data source is currently at:
https://github.com/perlancar/gudangdata (table/debian_release).

This release is made while waiting for the new release of L<Debian::Releases>
which was promised in 2014 and will contain extra data as well.


=head1 SEE ALSO

L<Ubuntu::Releases>

L<Debian::Releases>

=cut
