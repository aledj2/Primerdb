#!/usr/bin/perl
use Tie::File;
use Fcntl;
use strict;
use warnings;
 # import the Tie::File module which allows a file to be read one line at a time
 
 #define variables
my (@primers,$primers);
my $Gene;
my$ExonFragment;
my$Chromosome;
my$PrimerName;
my$New_name;
my$PrimerSeq;
my$PCRProgramme;
my$PCRConditions;
my$Modification;
my$AmpliconSize;
my$StockConc ;
my$Tray;
my$GridRef;
my$Supplier;
my$DateMade;
my$ProductCode;
my$Expirydate;
my$BatchNo;
my$OligoNo;
my$ShipmentDate;
my$SNPchecked;
my$DateofSNPcheck;
my$SNPdbBuild;
my$SNPresult;
my$Assay;
my$CorrectPrimers;
my$GenebankPanels;
my$UCSC;
my$nt;
my$notes;
my$PrimersValidated;
my$RS;
# open 
tie @primers, 'Tie::File', "/home/aled/Documents/primerdb/allprimers.csv";
open (MYFILE, '>>/home/aled/Documents/primerdb/primersequences.fa');

foreach $primers (@primers) {
	my @s = split(/,/, $primers);
	( my $Gene,my$ExonFragment,my$Chromosome,my$PrimerName,my$New_name,my$PrimerSeq,my$PCRProgramme,my$PCRConditions,my$Modification,my$AmpliconSize,my$StockConc,my$Tray,my$GridRef,my$Supplier,my$DateMade,my$ProductCode,my$Expirydate,my$BatchNo,my$OligoNo,my$ShipmentDate,my$SNPchecked,my$DateofSNPcheck,my$SNPdbBuild,my$SNPresult,my$Assay,my$CorrectPrimers,my$GenebankPanels,my$UCSC,my$nt,my$notes,my$PrimersValidated,my$RS) = @s;
	print MYFILE "> $PrimerName \n $PrimerSeq \n";
	} untie @primers;