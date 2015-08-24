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
my$version;

#use tie::file to put each line of spreadsheet into a element of an array
tie @primers, 'Tie::File', "/home/aled/Documents/primerdb/primers091114/primers151014.csv";
tie@genes,'Tie::File',"/home/aled/Documents/primerdb/genecoods.csv";

                                                                    
#create variables for each blat run
my$minscore;
my$coordinates;
my$output;
my$filename;
my$filepath;
my$blat = "blat -noHead -tileSize=6 -stepSize=5";

#for each row in the genelist spliit into variables. 
	#print "$HGNCGenename,$GeneChrom,$Genestart,$GeneStop\n";
	#for each row in primer list spli t into variables
foreach $primers (@primers) {
	my @s = split(/,/, $primers);
	($Gene,$ExonFragment,$Chromosome,$PrimerName,$New_name,$version,$PrimerSeq,$PCRProgramme,$PCRConditions,$Modification,$AmpliconSize,$StockConc,$Tray,$GridRef,$Supplier,$DateMade,$ProductCode,$Expirydate,$BatchNo,$OligoNo,$ShipmentDate,$SNPchecked,$DateofSNPcheck,$SNPdbBuild,$SNPresult,$Assay,$CorrectPrimers,$GenebankPanels,$UCSC,$nt,$notes,$PrimersValidated,$RS) = @s;
		#print "$Gene,$PrimerName,$PrimerSeq\n";
		foreach $genes(@genes){
			my @ss = split(/,/, $genes);
				($HGNCGenename,$GeneChrom,$Genestart,$GeneStop)=@ss;
			 #foreach primer select the genename and then query against the list of genes. if there is a match take the chrom number, start and stop coordinates (the gene list has the start finish point +/- 500bp)
					if($Gene eq $HGNCGenename){
						#print "$Gene \n";
						$minscore = "-minScore=".(length($PrimerSeq)-1);
						#print "$minscore\n";
						#coords sets the reference sequence used for the BLAT query
						$coordinates="/home/aled/Documents/primerdb/hg19.2bit:chr$GeneChrom:$Genestart-$GeneStop";
						#print "coord:$coordinates\n";
						#output tells BLAT where to put the output. This will create a new file for each primer, each file called the primer name.psl.
						$output = "/home/aled/Documents/primerdb/primers091114/blat/$PrimerName.psl";
						print "output:$output\n";
						#filename is the primername.fa. thisis the previousy  created  fasta file containing  the primer name and sequence which will be used by BLAT
						$filename="$PrimerName.fa";
						$filepath = "/home/aled/Documents/primerdb/primers091114/fastas/$filename";
						#print"blatted: $filename\n";
						#print "$filepath\n";
						#open ($filename,">", $filepath ) or die "Couldn't open: $! \n";
						`$blat $minscore $coordinates $filepath $output`;
					}
				}
			}
			 untie @primers;
untie @genes;