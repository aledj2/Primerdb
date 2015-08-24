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
open (MYFILE1, '>>/home/aled/Documents/primerdb/chr1primers.fa');
open (MYFILE2, '>>/home/aled/Documents/primerdb/chr2primers.fa');
open (MYFILE3, '>>/home/aled/Documents/primerdb/chr3primers.fa');
open (MYFILE4, '>>/home/aled/Documents/primerdb/chr4primers.fa');
open (MYFILE5, '>>/home/aled/Documents/primerdb/chr5primers.fa');
open (MYFILE6, '>>/home/aled/Documents/primerdb/chr6primers.fa');
open (MYFILE7, '>>/home/aled/Documents/primerdb/chr7primers.fa');
open (MYFILE8, '>>/home/aled/Documents/primerdb/chr8primers.fa');
open (MYFILE9, '>>/home/aled/Documents/primerdb/chr9primers.fa');
open (MYFILE10, '>>/home/aled/Documents/primerdb/chr10primers.fa');
open (MYFILE11, '>>/home/aled/Documents/primerdb/chr11primers.fa');
open (MYFILE12, '>>/home/aled/Documents/primerdb/chr12primers.fa');
open (MYFILE13, '>>/home/aled/Documents/primerdb/chr13primers.fa');
open (MYFILE14, '>>/home/aled/Documents/primerdb/chr14primers.fa');
open (MYFILE15, '>>/home/aled/Documents/primerdb/chr15primers.fa');
open (MYFILE16, '>>/home/aled/Documents/primerdb/chr16primers.fa');
open (MYFILE17, '>>/home/aled/Documents/primerdb/chr17primers.fa');
open (MYFILE18, '>>/home/aled/Documents/primerdb/chr18primers.fa');
open (MYFILE19, '>>/home/aled/Documents/primerdb/chr19primers.fa');
open (MYFILE20, '>>/home/aled/Documents/primerdb/chr20primers.fa');
open (MYFILE21, '>>/home/aled/Documents/primerdb/chr21primers.fa');
open (MYFILE22, '>>/home/aled/Documents/primerdb/chr22primers.fa');
open (MYFILEX, '>>/home/aled/Documents/primerdb/chrXprimers.fa');
open (MYFILEY, '>>/home/aled/Documents/primerdb/chrYprimers.fa');
                                                                     


foreach $primers (@primers) {
	my @s = split(/,/, $primers);
	(my $Gene,my$ExonFragment,my$Chromosome,my$PrimerName,my$New_name,my$PrimerSeq,my$PCRProgramme,my$PCRConditions,my$Modification,my$AmpliconSize,my$StockConc,my$Tray,my$GridRef,my$Supplier,my$DateMade,my$ProductCode,my$Expirydate,my$BatchNo,my$OligoNo,my$ShipmentDate,my$SNPchecked,my$DateofSNPcheck,my$SNPdbBuild,my$SNPresult,my$Assay,my$CorrectPrimers,my$GenebankPanels,my$UCSC,my$nt,my$notes,my$PrimersValidated,my$RS) = @s;
	if ($Chromosome==1){
	print MYFILE1 "> $PrimerName \n $PrimerSeq \n";
	}elsif ($Chromosome==2){
	print MYFILE2 "> $PrimerName \n $PrimerSeq \n";
	}elsif ($Chromosome==3){
	print MYFILE3 "> $PrimerName \n $PrimerSeq \n";
	}elsif ($Chromosome==4){
	print MYFILE4 "> $PrimerName \n $PrimerSeq \n";
	}elsif ($Chromosome==5){
	print MYFILE5 "> $PrimerName \n $PrimerSeq \n";
	}elsif ($Chromosome==6){
	print MYFILE6 "> $PrimerName \n $PrimerSeq \n";
	}elsif ($Chromosome==7){
	print MYFILE7"> $PrimerName \n $PrimerSeq \n";
	}elsif ($Chromosome==8){
	print MYFILE8 "> $PrimerName \n $PrimerSeq \n";
	}elsif ($Chromosome==9){
	print MYFILE9 "> $PrimerName \n $PrimerSeq \n";
	}elsif ($Chromosome==10){
	print MYFILE10 "> $PrimerName \n $PrimerSeq \n";
	}elsif ($Chromosome==11){
	print MYFILE2 "> $PrimerName \n $PrimerSeq \n";
	}elsif ($Chromosome==12){
	print MYFILE12 "> $PrimerName \n $PrimerSeq \n";
	}elsif ($Chromosome==13){
	print MYFILE13 "> $PrimerName \n $PrimerSeq \n";
	}elsif ($Chromosome==14){
	print MYFILE14 "> $PrimerName \n $PrimerSeq \n";
	}elsif ($Chromosome==15){
	print MYFILE15 "> $PrimerName \n $PrimerSeq \n";
	}elsif ($Chromosome==16){
	print MYFILE16 "> $PrimerName \n $PrimerSeq \n";
	}elsif ($Chromosome==17){
	print MYFILE17 "> $PrimerName \n $PrimerSeq \n";
	}elsif ($Chromosome==18){
	print MYFILE18 "> $PrimerName \n $PrimerSeq \n";
	}elsif ($Chromosome==19){
	print MYFILE19 "> $PrimerName \n $PrimerSeq \n";
	}elsif ($Chromosome==20){
	print MYFILE20 "> $PrimerName \n $PrimerSeq \n";
	}elsif ($Chromosome==21){
	print MYFILE21 "> $PrimerName \n $PrimerSeq \n";
	}elsif ($Chromosome==22){
	print MYFILE22"> $PrimerName \n $PrimerSeq \n";
	}elsif ($Chromosome eq"X"){
	print MYFILEX "> $PrimerName \n $PrimerSeq \n";
	}elsif ($Chromosome eq"y"){
	print MYFILEY "> $PrimerName \n $PrimerSeq \n";
}
		} untie @primers;