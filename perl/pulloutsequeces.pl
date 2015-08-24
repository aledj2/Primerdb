#!/usr/bin/perl
use Tie::File;
use Fcntl;
use strict;
use warnings;
 
open INPUT, '<', '/home/aled/Documents/primerdb/ACTA.csv' or die $!;
my @PRIMERS = <INPUT>;
my $primers;
my $Gene;
my $Exon;
my $Chromosomes;
my $Primername;
my $Newname;
my $Primerseq;
my $PCRcond;
my $Modification;
my $Ampsize;
my $Stock;
my $Tray;
my $Gridref;
my $SNPCheck;
my $datesnpcheck;
my $SNPdbbuild;
my $SNP;
#opens file under handle Input which is then put into the array Moka. Each vairable is then defined.

open (MYFILE, '>>/home/aled/Documents/primerdb/primersequences.fa');
while (<INPUT>)
foreach  $primers(@PRIMERS) {
	my @s = split(/,/, $primers);
	($Gene,$Exon,$Chromosomes,$Primername,$Newname,$Primerseq,$PCRcond,$Modification,$Ampsize,$Stock,$Tray,$Gridref,$SNPCheck,$datesnpcheck,$SNPdbbuild,$SNP) = @s;
	print MYFILE "> $Primername \n $Primerseq \n";
	close (MYFILE);
}
close (INPUT);