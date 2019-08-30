bwa index ./CRemanei_reference/c_remanei.PRJNA248909.WS252.genomic.fa 

for file in $(ls ./FASTQ/*_1P.fastq | rev | cut -c 10- | rev | uniq); do
bwa mem -t 4 -M ./CRemanei_reference/c_remanei.PRJNA248909.WS252.genomic.fa  ${file}_1P.fastq ${file}_2P.fastq > ./BAMS/`basename ${file}`.sam
done

for file in $(ls ./FASTQ/*.fastq | grep -v "_1" | grep -v "_2" | rev | cut -c 7- | rev | uniq); do
bwa mem -t 4 -M ./CRemanei_reference/c_remanei.PRJNA248909.WS252.genomic.fa  ${file}.fastq > ./BAMS/`basename ${file}`.sam
done


for file in $(ls ./BAMS/*.sam | rev | cut -c 5- | rev | uniq);do
samtools view -Sb ${file}.sam -o ${file}.bam
done
