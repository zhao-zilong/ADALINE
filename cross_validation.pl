my @step = [0.00001,0.0001,0.001,0.01,0.1];
my @apprentissage;
my @validation;
my $iteApprenti = 0;
my $iteValid = 0;



my ($FileName)=$ARGV[0]; # Tableau des paramètres
open(F,$FileName) || die "Erreur d'ouverture du fichier $FileName\n";
my $counter = 0;
my @record;
my $longer = 0;
while (my $ligne = <F>){
  my @mail = split(' ',$ligne);
  $longer = scalar @mail;
  for(my $i = 0; $i < $longer; $i++){
    $record[$counter][$i] = @mail[$i];
  }
  $counter++;
}
$dimension = $longer - 1;
for(my $i = 0; $i < $dimension; $i++){
  @w[$i] = 0;
}


for($j = 0; $j < 5; $j ++){
  #seperate apprentissage
  for($k = 0; $k < $counter; $k++){
  my $random = rand(10);
  if($random >= 8){
    for(my $i = 0; $i < $longer; $i++){
      @apprentissage[$iteApprenti][$i] = @record[$k][$i];
      $iteApprenti++;
    }
  }
  else{
    for(my $i = 0; $i < $longer; $i++){
      @iteValid[$iteValid][$i] = @record[$k][$i];
      $iteValid++;
    }
  }
 }

 my $n = $step[$j];
 my $cmpt = 0;
 while($cmpt <= 50000){
       my $ligne_chose = int(rand($iteApprenti));
       my $produit = 0;
       for(my $i = 0; $i < $dimension; $i++){
         $produit = $produit + $w[$i]*$apprentissage[$ligne_chose][$i+1];
       }
          my $h = $produit + $b;
          $b = $b + $n*($apprentissage[$ligne_chose][0] - $h);

       for($j = 0; $j < $dimension; $j++){
          $w[$j] = $w[$j] + $n*($apprentissage[$ligne_chose][0] - $h)*$apprentissage[$ligne_chose][$j+1];
       }
   $cmpt++;
 }
 #train


 #test
 my $t = 0;
 my $right = 0;
 my $wrong = 0;

 while($t < $counter){
   my $result = 0;
   for(my $i = 0; $i < $dimension-1; $i++){
      $result = $result + $record[$t][$i+1]*$coeffcient[$i+1];
   }
   $result = $result + $coeffcient[0]; #w0
   if(($result >= 0 && $record[$t][0] == 1) || ($result <= 0 && $record[$t][0] == -1)){
       $right++;
   }
   else{
       $wrong++;
   }
   $t++;

 }

}
