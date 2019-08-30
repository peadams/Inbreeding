gmap_build -D gsnap_databases/ -d Cremanei ./CRemanei_reference/c_remanei.PRJNA248909.WS252.genomic.fa


for file in $(ls ./FASTQ/*_1P.fastq | rev | cut -c 10- | rev | uniq); do
gsnap -B 5 -t 8 --use-sarray=0 -A sam -D ./gsnap_databases/ -d Cremanei ${file}_1P.fastq ${file}_2P.fastq > ./BAMS/gsnap/`basename ${file}`.sam
done


for file in $(ls ./FASTQ/*.fastq | grep -v "_1" | grep -v "_2" | rev | cut -c 7- | rev | uniq); do
gsnap -B 5 -t 8 --use-sarray=0 -A sam -D ./gsnap_databases/ -d Cremanei ${file}.fastq > ./BAMS/gsnap/`basename ${file}`.sam
done


use bioinfoGCC
for file in $(ls ./BAMS/gsnap/*.sam | rev | cut -c 5- | rev | uniq);do
samtools view -Sb ${file}.sam -o ${file}.bam
done
