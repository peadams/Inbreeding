#paired end reads
java -jar /home/damurdock/Trimmomatic-0.36/trimmomatic-0.36.jar PE -phred33 -trimlog trimlog.out ./FASTQ/356_1.fastq ./FASTQ/356_2.fastq -baseout ./FASTQ/356_out ILLUMINACLIP:adapters.fa:2:30:10 LEADING:3 TRAILING:3 SLIDINGWINDOW:4:15 MINLEN:51

java -jar /home/damurdock/Trimmomatic-0.36/trimmomatic-0.36.jar PE -phred33 -trimlog trimlog.out ./FASTQ/NYLT_2_gen212_1.fastq ./FASTQ/NYLT_2_gen212_2.fastq -baseout ./FASTQ/NYLT_2_gen212_out ILLUMINACLIP:adapters.fa:2:30:10 LEADING:3 TRAILING:3 SLIDINGWINDOW:4:15 MINLEN:51

java -jar /home/damurdock/Trimmomatic-0.36/trimmomatic-0.36.jar PE -phred33 -trimlog trimlog.out ./FASTQ/NYLT_5_gen212_1.fastq ./FASTQ/NYLT_5_gen212_2.fastq -baseout ./FASTQ/NYLT_5_gen212_out ILLUMINACLIP:adapters.fa:2:30:10 LEADING:3 TRAILING:3 SLIDINGWINDOW:4:15 MINLEN:51



#single-end reads
java -jar /home/damurdock/Trimmomatic-0.36/trimmomatic-0.36.jar SE -phred33 -trimlog trimlog.out ./FASTQ/EM464_gen3.fastq      ./FASTQ/EM464_gen3_out.fastq ILLUMINACLIP:adapters.fa:2:30:10 LEADING:3 TRAILING:3 SLIDINGWINDOW:4:15 MINLEN:51

java -jar /home/damurdock/Trimmomatic-0.36/trimmomatic-0.36.jar SE -phred33 -trimlog trimlog.out ./FASTQ/NYLT_2_gen114.fastq   ./FASTQ/NYLT_2_gen114_out.fastq  ILLUMINACLIP:adapters.fa:2:30:10 LEADING:3 TRAILING:3 SLIDINGWINDOW:4:15 MINLEN:51

java -jar /home/damurdock/Trimmomatic-0.36/trimmomatic-0.36.jar SE -phred33 -trimlog trimlog.out ./FASTQ/NYLT_3_gen100.fastq   ./FASTQ/NYLT_3_gen100_out.fastq  ILLUMINACLIP:adapters.fa:2:30:10 LEADING:3 TRAILING:3 SLIDINGWINDOW:4:15 MINLEN:51

java -jar /home/damurdock/Trimmomatic-0.36/trimmomatic-0.36.jar SE -phred33 -trimlog trimlog.out ./FASTQ/NYLT_3_gen208.fastq   ./FASTQ/NYLT_3_gen208_out.fastq ILLUMINACLIP:adapters.fa:2:30:10 LEADING:3 TRAILING:3 SLIDINGWINDOW:4:15 MINLEN:51

java -jar /home/damurdock/Trimmomatic-0.36/trimmomatic-0.36.jar SE -phred33 -trimlog trimlog.out ./FASTQ/NYLT_5_gen111.fastq   ./FASTQ/NYLT_5_gen111_out.fastq ILLUMINACLIP:adapters.fa:2:30:10 LEADING:3 TRAILING:3 SLIDINGWINDOW:4:15 MINLEN:51
