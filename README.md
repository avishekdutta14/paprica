###Notice - A bug was identified in paprica_build_ref_v0.20.py.  We've fixed the bug, and are currently testing the fix with the rest of the pipeline.  In the meantime the paprica_run.sh script should work fine with the provided database, but if you are trying to build your own database with paprica_build.sh you will run into trouble.  The fix will be available soon.

#PAPRICA
###PAthway PRediction by phylogenetIC plAcement

A pipeline to conduct a metabolic inference from 16S rRNA gene sequence libraries.  Check out paprica_manual.pdf and paprica_run.sh to get started.  Once you've downloaded the genome_finder directory the commands:

chmod a+x paprica_run.sh

./paprica_run.sh test

Should get you going and execute a run on the file test.fasta.

###Citation

Please cite PAPRICA as:

Bowman, Jeff S., and Hugh W. Ducklow. "Microbial Communities Can Be Described by Metabolic Structure: A General Framework and Application to a Seasonally Variable, Depth-Stratified Microbial Community from the Coastal West Antarctic Peninsula." PloS one 10.8 (2015): e0135868.

###Overview

Paprica conducts metabolic inference on (preferably, but not exclusively, NGS) 16S rRNA gene libraries.  Instead of using an OTU based approach, however, it uses a phylogenetic placement approach.  This provides a more intuitive connection between its �hidden state prediction� and library analysis components, and allows resolution at the strain and species level for some spots on the prokaryotic phylogenetic tree.

Paprica uses pathways shared between the members of all clades on a reference tree to determine what pathways are likely to be associated with a phylogenetically placed read.

Paprica was designed to use a significant amount of resources up front to construct a database and draft metabolic models for all available completed genomes (allow for 8 hours on a 12 core machine with hyperthreading enabled).  You can avoid this by using the provided database and the paprica_run.sh script. 
