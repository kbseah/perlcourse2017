#!/usr/bin/perl -w
use strict;
#Script written by L. Sayavedra as part of the perl course held on feb.2017

my $line;
my $flag=0;
my $seq;
my @seq;
my $nt_seq="";
my $locus_tag;
my %prot_seqs;
my %prot_product;
my $product;

while ($line = <>){   #While the file is being read. Perl reads the file line by line!                  
    chomp $line;
    if ($line=~ /(.*)\/db_xref\=.*peg\.(\S+)\"/){ 
        $line = $1 . "locus_tag=\"SOX" . $2 ;
        $locus_tag = "SOX" . $2;
    }
    if ($line=~/(.*\/translation=\")(\S+)\"*/){
        $seq= "";
        $flag =1;   #this flag is used to indicate that there is a protein sequence in the file
        $seq=$2;
    }
    if (($flag== 1) && ($line!~/.*\//) ){   #if there is protein sequence on the current line, and there is no other tag of the gbk file
        $line=~ s/ //g;
        $seq = join ("", $seq, $line);
    }
    if ($line=~/\/product=\"(.*)\"/){  #if the next tag is present the protien sequence is over
				$flag =0;
				$product =$1;
				$seq =~ s/\"//;
				$prot_product {$locus_tag} = $product;   #this will create a key with the locus tag in the current memory.
				$prot_seqs {$locus_tag} = $seq;
    }
}

$seq =~ s/\"//;
$nt_seq =~ s/ //g;

##Extract the keys of the hash prot_product and print them to the screen

foreach my $locus (keys (%prot_product)){
	print ">". $locus . " ". $prot_product{$locus}. "\n";
	print "$prot_seqs{$locus}\n";
}

