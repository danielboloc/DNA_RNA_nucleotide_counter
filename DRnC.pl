#! usr/bin/perl

# Counting the number of A G C AND T in a DNA sequence 
# Counting the number of A G C AND U in a RNA sequence 

use strict;
use warnings;

# Select between DNA or RNA
print "Type 'dna' if you have a DNA sequence, or type 'rna' if you have a RNA sequence: \n";

my $choice = <>;
chomp ($choice);

if (($choice =~ /dna/) || ($choice =~ /DNA/)) {
	
	# Demand the sequence as a input
	print "Input the DNA sequence to calculate the percentage of each nucleotide: \n";
	# Store the input in a variable
	my $DNA_input = <>;
	# Delete the "enter" or "return" after putting the sequence
	chomp ($DNA_input);
	# Call and collect the result
	&countAGCT_DNA($DNA_input);

} elsif (($choice =~ /rna/) || ($choice =~ /DNA/)) {  

	print "Input the RNA sequence to calculate the percentage of each nucleotide: \n";

	my $RNA_input = <>;

	chomp ($RNA_input);

	&countAGCU_RNA($RNA_input);
} else {

	print "### ERROR ### Input a sequence of DNA or RNA";
}

# Exit the program
exit;

#
##SUBROUTINES
sub countAGCT_DNA ($) {
	my($dna) = @_;

	# Initialize the variables and the count
	my ($count_A, $count_G, $count_C, $count_T, $total) = 0;
	my ($count_A_prctg, $count_G_prctg, $count_C_prctg, $count_T_prctg);

	# Count the nucleotides with the tr///
	$count_A = ($dna =~ tr/Aa//);
	$count_G = ($dna =~ tr/Gg//);
	$count_C = ($dna =~ tr/Cc//);
	$count_T = ($dna =~ tr/Tt//);
	$total   = ($count_A + $count_G + $count_C + $count_T);

	# Used for the percentage
	$count_A_prctg = $count_A/$total;
	$count_G_prctg = $count_G/$total;
	$count_C_prctg = $count_C/$total;
	$count_T_prctg = $count_T/$total;

	# Print all the results
	print "\nIn your DNA sequence you have:\nA: $count_A\nG: $count_G\nC: $count_C\nT: $count_T\n\n";

	printf "In percentage, you have:\nA: %.2f", $count_A_prctg;
	printf "\nG: %.2f", $count_G_prctg;
	printf "\nC: %.2f", $count_C_prctg;
	printf "\nT: %.2f\n", $count_T_prctg;

}; # countAGCT_input

sub countAGCU_RNA ($) {
	my($rna) = @_;

	# Initialize the variables and the count
	my ($count_A, $count_G, $count_C, $count_U, $total) = 0;
	my ($count_A_prctg, $count_G_prctg, $count_C_prctg, $count_U_prctg);

	# Count the nucleotides with the tr///
	$count_A = ($rna =~ tr/Aa//);
	$count_G = ($rna =~ tr/Gg//);
	$count_C = ($rna =~ tr/Cc//);
	$count_U = ($rna =~ tr/Uu//);
	$total   = ($count_A + $count_G + $count_C + $count_U);

	# Used for the percentage
	$count_A_prctg = $count_A/$total;
	$count_G_prctg = $count_G/$total;
	$count_C_prctg = $count_C/$total;
	$count_U_prctg = $count_U/$total;

	# Print all the results
	print "\nIn your RNA sequence you have:\nA: $count_A\nG: $count_G\nC: $count_C\nU: $count_U\n\n";

	printf "In percentage, you have:\nA: %.2f", $count_A_prctg;
	printf "\nG: %.2f", $count_G_prctg;
	printf "\nC: %.2f", $count_C_prctg;
	printf "\nU: %.2f\n", $count_U_prctg;

}; # countAGCT_input
