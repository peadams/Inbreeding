Explanation of each file:

trimmomatic.sh 
	Filter reads with Trimmomatic

bwa.sh & gsnap.sh
	Align reads with BWA and GSNAP, also converts .SAM file to .BAM file

GATK_indelrealign.sh
	Use Picard tool functions SortSam, MarkDuplicates,AddOrReplaceReadGroups,BuildBamIndex, SortSam, CreateSequenceDictionary, ReoderSam, and BuildBamIndex
	Use GATK functions RealignerTargetCreator and IndelRealigner
	Then use Samtools to filter by '-f 0x2'
	Also creates an mpileup

MAPGD.sh
	Uses MAPGD software command ‘proview’ to create a .pro file (similar to a sync file)
	Then uses the ‘pool’ command to create a map.pol file which contains allele frequency estimates with log-likelihood ratios. 





