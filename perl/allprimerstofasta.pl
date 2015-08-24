#!/usr/bin/perl
use Tie::File;
use Fcntl;
#use strict;
use warnings;
 # import the Tie::File module which allows a file to be read one line at a time
 
 #define variables
my (@primers,$primers);
# my $Gene;
# my$ExonFragment;
# my$Chromosome;
# my$PrimerName;
# my$New_name;
# my$PrimerSeq;
# my$PCRProgramme;
# my$PCRConditions;
# my$Modification;
# my$AmpliconSize;
# my$StockConc ;
# my$Tray;
# my$GridRef;
# my$Supplier;
# my$DateMade;
# my$ProductCode;
# my$Expirydate;
# my$BatchNo;
# my$OligoNo;
# my$ShipmentDate;
# my$SNPchecked;
# my$DateofSNPcheck;
# my$SNPdbBuild;
# my$SNPresult;
# my$Assay;
# my$CorrectPrimers;
# my$GenebankPanels;
# my$UCSC;
# my$nt;
# my$notes;
# my$PrimersValidated;
# my$RS;

tie @primers, 'Tie::File', "/home/aled/Documents/primerdb/primers091114/primers151014.csv";

foreach $primers (@primers) {
	my @s = split(/,/, $primers);
		(my $primername_conc,my$Gene,my$Exon,my$Chromosome,my$PrimerName,my$NewName,my$Version,my$PRIMERSEQ,my$PCRprogramme,my$PCR_SeqConditions,my$Modification,my$AmpliconSize,my$StockConc,my$Tray,my$Grid_Ref,my$Supplier,my$Date_made,my$ProductCode,my$ExpiryDate,my$BatchNo,my$OligoNo,my$ShipmentDate,my$SNPChecked,my$DateofSNPcheck,my$SNPdbBuild,my$SNPresult,my$Assay,my$CorrectPrimers,my$listsupdated,my$UCSC,my$nt,my$notes,my$PrimersValidated,my$RS)=@s;
	#( my $Gene,my$ExonFragment,my$Chromosome,my$PrimerName,my$New_name,my$PrimerSeq,my$PCRProgramme,my$PCRConditions,my$Modification,my$AmpliconSize,my$StockConc,my$Tray,my$GridRef,my$Supplier,my$DateMade,my$ProductCode,my$Expirydate,my$BatchNo,my$OligoNo,my$ShipmentDate,my$SNPchecked,my$DateofSNPcheck,my$SNPdbBuild,my$SNPresult,my$Assay,my$CorrectPrimers,my$GenebankPanels,my$UCSC,my$nt,my$notes,my$PrimersValidated,my$RS) = @s;
		if (length($PRIMERSEQ)>10){
			my $filename = $PrimerName;
			open ($filename, ">", "/home/aled/Documents/primerdb/primers091114/fastas/$filename.fa");
			print $filename ">$PrimerName \n$PRIMERSEQ";
			close $filename;
	}
	} untie @primers;