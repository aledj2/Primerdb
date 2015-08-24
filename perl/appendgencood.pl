#!/usr/bin/perl
use Tie::File;
use Fcntl;
use strict;
use warnings;
 # import the Tie::File module which allows a file to be read one line at a time
 
 #define variables
my (@primers,$primers);
my$combinedfile;
my(@psl,$psl);
tie @primers, 'Tie::File', "/home/aled/Documents/primerdb/allprimers.csv";
open ($combinedfile,">>", "/home/aled/Documents/primerdb/combinedfiles.csv");


foreach $primers (@primers) {
	my @s = split(/,/, $primers);
	( my$Gene,my$ExonFragment,my$Chromosome,my$PrimerName,my$New_name,my$PrimerSeq,my$PCRProgramme,my$PCRConditions,my$Modification,my$AmpliconSize,my$StockConc,my$Tray,my$GridRef,my$Supplier,my$DateMade,my$ProductCode,my$Expirydate,my$BatchNo,my$OligoNo,my$ShipmentDate,my$SNPchecked,my$DateofSNPcheck,my$SNPdbBuild,my$SNPresult,my$Assay,my$CorrectPrimers,my$GenebankPanels,my$UCSC,my$nt,my$notes,my$PrimersValidated,my$RS) = @s;
			my $filename = "$PrimerName.psl";
			#print "$filename \n";}
			#prints filename ok with .psl - a search shows that these files can be found!
			open ($psl, "</home/aled/Documents/primerdb/blatoutput2/$filename");
			my$pslref=\\$psl;
			print "$pslref \n";
		}
			__END__
			#@psl=<PSL>;
			#print "@psl \n";
			my@s2= split(/\t/,@psl);
			#print @s2;
			(my$col1,my$col2,my$col3,my$col4,my$col5,my$col6,my$col7,my$col8,my$col9,my$col10,my$col11,my$col12,my$col13,my$col14,my$col15,my$col16,my$col17,my$col18,my$col19,my$col20,my$col21)= @s2;
			print @s2;
			#print $combinedfile "$Gene,$ExonFragment,$Chromosome,$PrimerName,$New_name,$PrimerSeq,$col13,$col9,$PCRProgramme,$PCRConditions,$Modification,$AmpliconSize,$StockConc,$Tray,$GridRef,$Supplier,$DateMade,$ProductCode,$Expirydate,$BatchNo,$OligoNo,$ShipmentDate,$SNPchecked,$DateofSNPcheck,$SNPdbBuild,$SNPresult,$Assay,$CorrectPrimers,$GenebankPanels,$UCSC,$nt,$notes,$PrimersValidated,$RS \n";
			#close PSL;
	 }
 untie @primers;
 close $combinedfile;