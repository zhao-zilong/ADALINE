#!/bin/bash

    ./pre-traiter.pl spambase/spambase.data
    ./normalize.pl format
for i in {1..20}
  do
     ./repartir_aleatoire.pl format
     ./adaline.pl apprentissage
     ./verifier.pl test hyperplan
  done

     ./calculate_average.pl result.txt
