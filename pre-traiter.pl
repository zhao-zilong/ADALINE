#!/usr/bin/perl
my ($FileName)=$ARGV[0]; # Tableau des paramètres
open(F,$FileName) || die "Erreur d'ouverture du fichier $FileName\n";
open(R,">./format") || die "Erreur de creation de format\n";


open(ML,"max_line.txt") or die "Error to open max_line.txt\n";


my $ligne = <ML>;
my @maxcolonne = split(' ',$ligne);


#my @maxcolonne = `perl normalize.pl format`;
close(ML);
my $dimension = scalar @maxcolonne;
print "in pre-traiter.pl $dimension\n";

while (my $ligne = <F>){
  my @tab=split(',',$ligne);
  my $longer = scalar @tab;
  my @result;
  if(@tab[$longer-1] == 1){
     $result[0] = 1;
  }
  else{
     $result[0] = -1;
  }

  for(my $i = 1; $i < $longer; $i++){
     $result[$i] = @tab[$i - 1]/@maxcolonne[$i-1];
  }
  for(my $i = 0; $i < $longer-1; $i++){
    print R "@result[$i] ";
  }
    print R "@result[$longer-1]\n";
}
close(F);
close(R);



#print "@tab[56], @tab[57]\n";
