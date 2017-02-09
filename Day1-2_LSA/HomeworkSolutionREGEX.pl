#!/usr/bin/perl -w
use strict;
#Script written by L. Sayavedra as part of the perl course held on feb.2017

my $line;
my $flag=0;
my $seq;
my @seq;
my $nt_seq="";
my $locus_tag;

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
        #print $line;   
    }
    if (($flag== 1) && ($line!~/.*\//) ){   #if there is protein sequence on the current line, and there is no other tag of the gbk file
        $line=~ s/ //g;
        $seq = join ("", $seq, $line);
    }
    if ($line=~/\/product/){  #if the next tag is present the protien sequence is over
        $flag =0;
    }
    if ($line=~ /\d+\s+(\D+\s*)/){
        $nt_seq = join ("", $nt_seq, $1);
    }
}

$seq =~ s/\"//;
$nt_seq =~ s/ //g;

print "The protein sequence of $locus_tag is $seq \n";
print "The nucleotide sequence is $nt_seq \n";

#######Homework solution

##Change the nucleotide sequence from lower case to upper case
 $nt_seq =~ tr/a-z/A-Z/;
print "\nThe upper case is $nt_seq\n";
 
# alternatively you can use the function **uc**
#$nt_seq = uc $nt_seq;
 
##Reverse complement the sequence

$nt_seq =~ tr/ATCG/TAGC/; #complements the sequence
$nt_seq = reverse $nt_seq;  #reverse the sequence


print "\nThe reverse complement is $nt_seq";
 
 
