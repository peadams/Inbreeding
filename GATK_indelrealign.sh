#Workflow for BWA shown 
for file in $(ls ./BAMS/*.bam | rev | cut -c 5- | rev | uniq);do (
java -Xmx2g -Djava.io.tmpdir=`pwd`/temp -jar /usr/local/Picard/picard.jar SortSam INPUT=${file}.bam OUTPUT=${file}-sort.bam SORT_ORDER=coordinate
java -Xmx2g -Djava.io.tmpdir=`pwd`/temp -jar /usr/local/Picard/picard.jar MarkDuplicates INPUT=${file}-sort.bam OUTPUT=${file}-dedup.bam METRICS_FILE=${file}-metrics.txt
java -Xmx2g -Djava.io.tmpdir=`pwd`/temp -jar /usr/local/Picard/picard.jar AddOrReplaceReadGroups INPUT=${file}-dedup.bam OUTPUT=${file}-addrg.bam RGID=group1 RGLB=lib1 RGPL=illumina RGPU=unit1 RGSM=sample1
java -Xmx2g -Djava.io.tmpdir=`pwd`/temp -jar /usr/local/Picard/picard.jar BuildBamIndex INPUT=${file}-addrg.bam
java -Xmx2g -Djava.io.tmpdir=`pwd`/temp -jar /usr/local/Picard/picard.jar SortSam INPUT=${file}-addrg.bam OUTPUT=${file}-sorted2.bam SORT_ORDER=coordinate
)&
done
wait


java -Xmx2g -Djava.io.tmpdir=`pwd`/temp -jar /usr/local/Picard/picard.jar CreateSequenceDictionary  REFERENCE=./CRemanei_reference/c_remanei.PRJNA248909.WS252.genomic.fa

for file in $(ls ./BAMS/*-sorted2.bam | rev | cut -c 13- | rev | uniq);do (
java -Xmx2g -Djava.io.tmpdir=`pwd`/temp -jar /usr/local/Picard/picard.jar ReorderSam INPUT=${file}-sorted2.bam OUTPUT=${file}-reordered.bam REFERENCE=./CRemanei_reference/c_remanei.PRJNA248909.WS252.genomic.fa CREATE_INDEX=TRUE
java -Xmx2g -Djava.io.tmpdir=`pwd`/temp -jar /usr/local/Picard/picard.jar BuildBamIndex INPUT=${file}-reordered.bam
)&
done
wait


#GATK Realigner Target Creator and Indel Realigner 
for file in $(ls ./BAMS/*-reordered.bam | rev | cut -c 15- | rev | uniq);do (
java -jar /usr/local/GATK/GenomeAnalysisTK.jar -T RealignerTargetCreator -R ./CRemanei_reference/c_remanei.PRJNA248909.WS252.genomic.fa -I ${file}-reordered.bam -o ${file}-realignment_targets.list -allowPotentiallyMisencodedQuals --filter_reads_with_N_cigar
java -jar /usr/local/GATK/GenomeAnalysisTK.jar -T IndelRealigner -R ./CRemanei_reference/c_remanei.PRJNA248909.WS252.genomic.fa -I ${file}-reordered.bam -targetIntervals ${file}-realignment_targets.list -o ${file}-realigned.bam -allowPotentiallyMisencodedQuals --filter_reads_with_N_cigar
)&
done
wait

for file in $(ls ./BAMS/*-realigned.bam | rev | cut -c 15- | rev | uniq);do (
samtools view -f 0x2 -b ${file}-realigned.bam -o ${file}-realigned-filtered.bam
)
done









#Samtools mpileup
samtools mpileup -B ./BAMS/356_out-realigned-filtered.bam ./BAMS/EM464_gen3_out-realigned.bam ./BAMS/NYLT_2_gen114_out-realigned.bam  ./BAMS/NYLT_2_gen212_out-realigned-filtered.bam ./BAMS/NYLT_3_gen100_out-realigned.bam ./BAMS/NYLT_3_gen208_out-realigned.bam ./BAMS/NYLT_5_gen111_out-realigned.bam  ./BAMS/NYLT_5_gen212_out-realigned-filtered.bam  -f CRemanei_reference/c_remanei.PRJNA248909.WS252.genomic.fa -q 25 -Q 25 > Filtered_bwa.mpileup





