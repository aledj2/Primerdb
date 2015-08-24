#!/usr/bin/perl
use Tie::File;
use Fcntl;
use strict;
use warnings;
# import the Tie::File module and Fcntl which allows a file to be read one line at a time

#open  up every file in blatoutput
#split into columns

# my$match;
# my$mismatch ;
# my$Ns;
# my$Qgapcount;
# my$Qgapbases;
# my$Tgapcount;
# my$Tgapbases;
# my$strand;
# my$Qname;
# my$Qsize;
# my$Qstart;
# my$Qend;
# my$Tname;
# my$Tsize;
# my$Tstart;
# my$Tend;
# my$blockcount;
# my$blocksize;
# my$qstartsdontuse;
# my$tstartsdontuse;


my @s = split(/\t/, $blat);
(my$match,my$mismatch,my$Ns,my$Qgapcount,my$Qgapbases,my$Tgapcount,my$Tgapbases,my$strand,my$Qname,my$Qsize,my$Qstart,my$Qend,my$Tname,my$Tsize,my$Tstart,my$Tend,my$blockcount,my$blocksize,my$qstartsdontuse,my$tstartsdontuse)=@s;

# select only 2nd or 3rd row
 my @s2 = split(//:/-/, $Tname);
 (my$Chrom,my$genestart,my$geneend)=@s2;
 if ($Qstart == 0){
	my$blatstart=$genestart+$Tstart+1;
	my$blatend=$genestart+$Tend;
	}else{
	 my$blatstart=$genestart+$Tstart;
	 my$blatend=$genestart+$Tend;
	}

 open (primercoords,">>", "/home/aled/Documents/primerdb/primercoords/primercoords.csv ") or die "Couldn't open: $! \n";
 print primercoords ("$Qname,$Chrom,$strand,$blatstart,$blatend");