#!/usr/bin/perl
use List::Util qw( min max );
#my $min = min @numbers;
#my $max = max @numbers;
my ($FileName)=$ARGV[0]; # Tableau des paramètres
open(F,$FileName) || die "Erreur d'ouverture du fichier $FileName\n";
my @result;
my $counter = 0;
my $longer = 0;
while (my $ligne = <F>){
  my @mail = split(' ',$ligne);
  $longer = scalar @mail;
  for(my $i = 0; $i < $longer; $i++){
    $result[$counter][$i] = @mail[$i];
  }
  $counter++;
}
my $dimension = $longer - 1;
my @colonne;
my @maxline;
for($j = 0; $j < $dimension; $j++){
    for($i = 0; $i < $counter; $i++){
        @colonne[$i] = $result[$i][$j+1];
    }
    my $maxcolonne = max @colonne;
#    print "$maxcolonne\n";
    @maxline[$j] = $maxcolonne;
}
# print "execute normalize\n";
# return @maxline;
for($k = 0; $k < $dimension; $k++){
   if($k != $dimension - 1){
      print "@maxline[$k] ";
   }
   else{
      print "@maxline[$k]\n";
   }

}
