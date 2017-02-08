#!/usr/bin/perl -w
use strict;

#Script written by L. Sayavedra as part of the perl course held on feb.2017
#Homework from day 2: Given a list of protein identifiers and a gbk file, extract the proteins with the same locus tag of the file



###############
##### Get from user: name of the file containing the list of identifiers and the gbk file (hard code it or not?)
my $usage = "scriptname.pl list_identifiers GBK out_faa";
my $seq_ident = shift or die $usage;
my $gbk = shift or die $usage;
my $out = shift or die $usage;

###############
my @identifiers;
my $j=0;
my $line;
my $flag=0;
my $seq;
my @seq;
my $nt_seq="";
my $locus_tag;
my %prot_seqs;
my %prot_product;
my $product;

#### Read the list of identifiers and add them to an array
####put in an array all the identifiers that are read in a file
open (FILE, $seq_ident) or die;
while (<FILE>){
    chomp;
    #print "$_";
    if (/(\S+)/){ 
    $identifiers[$j]=$1;
    $j++;
    #print "$1\n";
    }
}
@identifiers=sort(@identifiers);
 
close (FILE);
 #########################



###############
###############Read the GBK file, same as the exercise done during the class

open (GBK, $gbk) or die;
while ($line = <GBK>){   #While the file is being read. Perl reads the file line by line!                  
    chomp $line;
    if ($line=~ /(.*)\/db_xref\=.*peg\.(\S+)\"/){ 
        $line = $1 . "locus_tag=\"SOX" . $2 ;
        $locus_tag = "SOX" . $2;
    }
    if ($line=~/(.*\/translation=\")(\S+)\"*/){
        $seq= "";  ## this will make sure that the protein sequence is not concatenated with the previous CDS
        $flag =1;   #this flag is used to indicate that there is a protein sequence in the file
        $seq=$2;
    }
    if (($flag== 1) && ($line!~/.*\//) ){   #if there is protein sequence on the current line, and there is no other tag of the gbk file
        $line=~ s/ //g;
        $seq = join ("", $seq, $line);
    }
    if ($line=~/\/product=\"(.*)\"*/){  ## notice that I changed the regular expression to have an optional " at the end of the product. Some annotations continue in the next line
		$flag =0;
		$product =$1;
		$seq =~ s/\"//;
        $product=~ s/\"//;
		$prot_product {$locus_tag} = $product;   #this will create a key with the locus tag in the current memory.
		$prot_seqs {$locus_tag} = $seq;
    }
}

close (GBK); 
$nt_seq =~ s/ //g;

##############


##############Check which identifiers are present in the list with the requested proteins
foreach my $ident ( @identifiers){
    #print $prot_seqs {"SOX1612"}. "\n";
	if (exists $prot_seqs {$ident}){
		print ">". $ident. " " . $prot_product {$ident}. "\n" . $prot_seqs{$ident}. "\n";
	}
}



#Extract the keys of the hash prot_product and print them to the screen

#foreach my $locus (sort {$a cmp $b} (keys ( %prot_product))){
#	print ">". $locus . " ". $prot_product{$locus}. "\n";
#	print "$prot_seqs{$locus}\n";
#}

