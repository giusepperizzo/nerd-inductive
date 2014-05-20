#!/usr/bin/perl -w 

# This script reads in a .conll file and writes the most commonly occuring class as the to be predicted class for Weka 
# outputs CSV 

use strict ; 

open FILE, $ARGV[0] ;

while(my $input = <FILE>)
	{
	chomp $input ;
		if ($. == 1)
		{
		print "EXTRACTORTYPE,TOKEN,CLASS\n" ; 
		}
	else
		{
		my @parts = split/\t/,$input ;
		next if(scalar(@parts) < 3) ;
		$parts[0] =~ s/,/comma/g ; 
		$parts[0] =~ s/"/dquote/g ;
		$parts[0] =~ s/'/squote/g ; 
		$parts[2] =~ s/,/-/g ; 
		print $parts[2].',"'.$parts[0].'",'.$parts[1]."\n" ; 
		}
	}
