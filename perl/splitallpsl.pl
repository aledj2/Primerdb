#!/usr/bin/perl
use Tie::File;
use Fcntl;
#use strict;
use warnings;
 # import the Tie::File module which allows a file to be read one line at a time
 
 #define variables
my (@psl,$psl);

tie @psl, 'Tie::File', "/home/aled/Documents/primerdb/blatoutput/allpsl.psl";

foreach $psl (@psl) {
	my @s = split(/\t/, $psl);
	(my$col1,my$col2,my$col3,my$col4,my$col5,my$col6,my$col7,my$col8,my$col9,my$col10,my$col11,my$col12,my$col13,my$col14,my$col15,my$col16,my$col17,my$col18,my$col19,my$col20,my$col21)= @s;
			my $filename = $col10;
			open ($filename, ">", "/home/aled/Documents/primerdb/blatoutput2/$filename.psl");
			print $filename $psl;
			close $filename;
	}
 untie @psl;