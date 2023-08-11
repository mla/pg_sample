#!/usr/bin/env perl
# sudo apt-get install libtext-csv-perl
our $VERSION = "1.16";

use Text::CSV;

my $csv = Text::CSV->new({ binary => 1, auto_diag => 1 });


sub get_where_claus_csv{
	my ($file,$schema) = @_;
	my $fh_in;
	open $fh_in, "<", $file or die "$file: $!";
	my $headers = $csv->getline($fh_in);
	my %where_map;
	while (my $row = $csv->getline($fh_in)) {
		my $key=qq{"$schema"."$row->[0]"};
		if(exists($where_map{$key})){
			$where_map{$key}= qq{$where_map{$key} AND "$row->[1]" = "$row->[2]"};
		}else{
			$where_map{$key}=qq{"$row->[1]" = '$row->[2]'};
		}
	}
	close $fh_in;
	return %where_map;
}

# my @data=get_where_claus_csv("test.csv");
# foreach my $row (@data) {
# 	print "Table: " . $row->{table} . "\n";
# 	print "where: " . $row->{where_clause} . "\n";
# }


