#!/usr/bin/perl
use Tie::File;
use Fcntl;
# TURNED STRICT OFF TO ALLOW USE OF use strict;
use warnings;
 # import the Tie::File module which allows a file to be read one line at a time
 
 #define variables for spreadsheet columns
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

#define variables for gene columns
my (@genes,$genes);
my$HGNCGenename;
my$GeneChrom;
my$Genestart;
my$GeneStop;


#use tie::file to put each line of spreadsheet into a element of an array
tie @primers, 'Tie::File', "/home/aled/Documents/primerdb/allprimers.csv";
tie@genes,'Tie::File',"/home/aled/Documents/primerdb/genecoods.csv";

                                                                    
#create variables for each blat run
my$minscore;
my$coordinates;
my$output;
my$filename;
my$filepath;
my$blat = "blat -noHead -tileSize=6 -stepSize=5";

my (@matches,$matches);
my (@pn,$pn);
#for each row in the genelist spliit into variables. 
	#print "$HGNCGenename,$GeneChrom,$Genestart,$GeneStop\n";
	#for each row in primer list spli t into variables
foreach $primers (@primers) {
	my @s = split(/,/, $primers);
	($Gene,$ExonFragment,$Chromosome,$PrimerName,$New_name,$PrimerSeq,$PCRProgramme,$PCRConditions,$Modification,$AmpliconSize,$StockConc,$Tray,$GridRef,$Supplier,$DateMade,$ProductCode,$Expirydate,$BatchNo,$OligoNo,$ShipmentDate,$SNPchecked,$DateofSNPcheck,$SNPdbBuild,$SNPresult,$Assay,$CorrectPrimers,$GenebankPanels,$UCSC,$nt,$notes,$PrimersValidated,$RS) = @s;
		#print "$Gene,$PrimerName,$PrimerSeq\n";
		push @pn,$PrimerName;
		foreach $genes(@genes){
			my @ss = split(/,/, $genes);
				($HGNCGenename,$GeneChrom,$Genestart,$GeneStop)=@ss;
			 #foreach primer select the genename and then query against the list of genes. if there is a match take the chrom number, start and stop coordinates (the gene list has the start finish point +/- 500bp)
					if($Gene eq $HGNCGenename){
						push @matches,$PrimerName;
					} 
				}
			}

			
my $i=0;
my%hash=();


foreach $matches(@matches){
	$hash{$matches}=$i;
	$i++;
	print $i;
}

foreach $pn(@pn){
	if($hash{$pn}==False){
	print $pn;
	}
}
