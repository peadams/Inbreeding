# MAPGD software from Ackerman and Lynch 
# https://github.com/LynchLab/MAPGD

# Proview creates a file similar to a sync file with some edits
mapgd proview -i Filtered_bwa.mpileup -H 356.header -o bwa

# Pool command creates allele frequency estimates with log-likelihood ratios
# Pool command is specifically for pooled sequencing
mapgd pool -i bwa.pro -o bwa_allelefreq.map

# '-a 22' option limits output to sites where the log-likelihood ratio of polymorphism is greater than 22. 
mapgd pool -i bwa.pro -a 22 -o bwa_allelefreq_filtered22.map


