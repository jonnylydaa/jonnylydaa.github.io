#!/bin/bash


# brew install node   # installs latest versions of node and npm


####for MsaView use HSV1_variants_clustalo.phylotree and HSV1_variant_alignment_clustalo.aln-stockholm files###########


############################################################
# Set up directories
# mkdir -p data results jbrowse2 config

# # Install JBrowse2 (if not already installed)
# if ! command -v jbrowse &> /dev/null; then
#   echo "Installing JBrowse2..."
#   npm install -g @jbrowse/cli
# fi

# # Initialize JBrowse2
# if [ ! -d "jbrowse2" ]; then
#   echo "Setting up JBrowse2..."
#   jbrowse create jbrowse2
# fi

# Download genome data
echo "Downloading human alphaherpesirus 1 genome..."
wget "https://ftp.ncbi.nlm.nih.gov/genomes/all/GCF/000/859/985/GCF_000859985.2_ViralProj15217/GCF_000859985.2_ViralProj15217_genomic.fna.gz" #https://ftp.ncbi.nlm.nih.gov/genomes/all/GCA_000857725.1/HSV1_genome.fasta
gunzip "GCF_000859985.2_ViralProj15217_genomic.fna.gz"
mv GCF_000859985.2_ViralProj15217_genomic.fna HSV1_genome.fasta
samtools faidx HSV1_genome.fasta
jbrowse add-assembly HSV1_genome.fasta --out $APACHE_ROOT/jbrowse2 --load copy

echo "Downloading human alphaherpesirus 2 genome..."
wget "https://ftp.ncbi.nlm.nih.gov/genomes/all/GCA/027/936/235/GCA_027936235.1_ASM2793623v1/GCA_027936235.1_ASM2793623v1_genomic.fna.gz" # https://ftp.ncbi.nlm.nih.gov/genomes/all/GCA_000857735.1/HSV2_genome.fasta
gunzip "GCA_027936235.1_ASM2793623v1_genomic.fna.gz"
mv GCA_027936235.1_ASM2793623v1_genomic.fna HSV2_genome.fasta
samtools faidx HSV2_genome.fasta
jbrowse add-assembly HSV2_genome.fasta --out $APACHE_ROOT/jbrowse2 --load copy

echo "Downloading human alphaherpesirus 3 genome..."
wget "https://ftp.ncbi.nlm.nih.gov/genomes/all/GCF/000/858/285/GCF_000858285.1_ViralProj15198/GCF_000858285.1_ViralProj15198_genomic.fna.gz"
gunzip "GCF_000858285.1_ViralProj15198_genomic.fna.gz"
mv GCF_000858285.1_ViralProj15198_genomic.fna HSV3_genome.fasta
samtools faidx HSV3_genome.fasta
jbrowse add-assembly HSV3_genome.fasta --out $APACHE_ROOT/jbrowse2 --load copy

echo "Downloading human alphaherpesirus 4 genome..."
wget "https://ftp.ncbi.nlm.nih.gov/genomes/all/GCF/002/402/265/GCF_002402265.1_ASM240226v1/GCF_002402265.1_ASM240226v1_genomic.fna.gz"
gunzip "GCF_002402265.1_ASM240226v1_genomic.fna.gz"
mv GCF_002402265.1_ASM240226v1_genomic.fna HSV4_genome.fasta
samtools faidx HSV4_genome.fasta
jbrowse add-assembly HSV4_genome.fasta --out $APACHE_ROOT/jbrowse2 --load copy

echo "Downloading human betaherpesvirus 7 genome..."
wget "https://ftp.ncbi.nlm.nih.gov/genomes/all/GCF/000/848/125/GCF_000848125.1_ViralProj14625/GCF_000848125.1_ViralProj14625_genomic.fna.gz"
gunzip "GCF_000848125.1_ViralProj14625_genomic.fna.gz"
mv GCF_000848125.1_ViralProj14625_genomic.fna HSV7_genome.fasta
samtools faidx HSV7_genome.fasta
jbrowse add-assembly HSV7_genome.fasta --out $APACHE_ROOT/jbrowse2 --load copy

echo "Downloading human gammaherpesvirus 8 genome..."
wget "https://ftp.ncbi.nlm.nih.gov/genomes/all/GCF/000/838/265/GCF_000838265.1_ViralProj14158/GCF_000838265.1_ViralProj14158_genomic.fna.gz"
gunzip "GCF_000838265.1_ViralProj14158_genomic.fna.gz"
mv GCF_000838265.1_ViralProj14158_genomic.fna HSV8_genome.fasta
samtools faidx HSV8_genome.fasta
jbrowse add-assembly HSV8_genome.fasta --out $APACHE_ROOT/jbrowse2 --load copy

########### HSV1 strains
### strain: HSV1-San-Francisco-USA-1982-H193-BB
echo "Downloading human alphaherpesirus 1 strains..."
wget "https://ftp.ncbi.nlm.nih.gov/genomes/all/GCA/027/937/225/GCA_027937225.1_ASM2793722v1/GCA_027937225.1_ASM2793722v1_genomic.fna.gz" #https://ftp.ncbi.nlm.nih.gov/genomes/all/GCA_000857725.1/HSV1_genome.fasta
gunzip "GCA_027937225.1_ASM2793722v1_genomic.fna.gz"
mv GCA_027937225.1_ASM2793722v1_genomic.fna HSV1_San-Francisco-USA-1982-H193-BB.fasta
samtools faidx HSV1_San-Francisco-USA-1982-H193-BB.fasta
jbrowse add-assembly HSV1_San-Francisco-USA-1982-H193-BB.fasta --out $APACHE_ROOT/jbrowse2 --load copy

### strain: B^3x1.1B
# echo "Downloading human alphaherpesirus 1 strains..."
wget "https://ftp.ncbi.nlm.nih.gov/genomes/all/GCA/027/937/005/GCA_027937005.1_ASM2793700v1/GCA_027937005.1_ASM2793700v1_genomic.fna.gz" #https://ftp.ncbi.nlm.nih.gov/genomes/all/GCA_000857725.1/HSV1_genome.fasta
gunzip "GCA_027937005.1_ASM2793700v1_genomic.fna.gz"
mv GCA_027937225.1_ASM2793722v1_genomic.fna HSV1_B3x11B.fasta
samtools faidx HSV1_B3x11B.fasta
jbrowse add-assembly HSV1_B3x11B.fasta --out $APACHE_ROOT/jbrowse2 --load copy

### strain: HSV-H1312
# echo "Downloading human alphaherpesirus 1 strains..."
wget "https://ftp.ncbi.nlm.nih.gov/genomes/all/GCA/027/936/485/GCA_027936485.1_ASM2793648v1/GCA_027936485.1_ASM2793648v1_genomic.fna.gz" #https://ftp.ncbi.nlm.nih.gov/genomes/all/GCA_000857725.1/HSV1_genome.fasta
gunzip "GCA_027936485.1_ASM2793648v1_genomic.fna.gz"
mv GCA_027936485.1_ASM2793648v1_genomic.fna HSV1_HSV-H1312.fasta
samtools faidx HSV1_HSV-H1312.fasta
jbrowse add-assembly HSV1_HSV-H1312.fasta --out $APACHE_ROOT/jbrowse2 --load copy

### strain: F
# echo "Downloading human alphaherpesirus 1 strains..."
wget "https://ftp.ncbi.nlm.nih.gov/genomes/all/GCA/027/937/465/GCA_027937465.1_ASM2793746v1/GCA_027937465.1_ASM2793746v1_genomic.fna.gz" #https://ftp.ncbi.nlm.nih.gov/genomes/all/GCA_000857725.1/HSV1_genome.fasta
gunzip "GCA_027937465.1_ASM2793746v1_genomic.fna.gz"
mv GCA_027937465.1_ASM2793746v1_genomic.fna HSV1_F.fasta
samtools faidx HSV1_F.fasta
jbrowse add-assembly HSV1_F.fasta --out $APACHE_ROOT/jbrowse2 --load copy

###################################################
###### Download gene annotated fasta files
echo "Downloading gene annotated human alphaherpesirus 1 genome..."
wget "https://ftp.ncbi.nlm.nih.gov/genomes/all/GCF/000/859/985/GCF_000859985.2_ViralProj15217/GCF_000859985.2_ViralProj15217_protein.faa.gz"
gunzip "GCF_000859985.2_ViralProj15217_protein.faa.gz"
mv GCF_000859985.2_ViralProj15217_protein.faa HSV1_gene_annotated_genome.fasta
samtools faidx HSV1_gene_annotated_genome.fasta
jbrowse add-assembly HSV1_gene_annotated_genome.fasta --out $APACHE_ROOT/jbrowse2 --load copy

echo "Downloading gene annotated human alphaherpesirus 1 F variant genome..."
wget "https://ftp.ncbi.nlm.nih.gov/genomes/all/GCA/027/937/465/GCA_027937465.1_ASM2793746v1/GCA_027937465.1_ASM2793746v1_protein.faa.gz"
gunzip "GCA_027937465.1_ASM2793746v1_protein.faa.gz"
mv GCA_027937465.1_ASM2793746v1_protein.faa HSV1_F_gene_annotated_genome.fasta
samtools faidx HSV1_F_gene_annotated_genome.fasta
jbrowse add-assembly HSV1_F_gene_annotated_genome.fasta --out $APACHE_ROOT/jbrowse2 --load copy

echo "Downloading gene annotated human alphaherpesirus 1 HSV1-San-Francisco-USA-1982-H193-BB variant genome..."
wget "https://ftp.ncbi.nlm.nih.gov/genomes/all/GCA/027/937/225/GCA_027937225.1_ASM2793722v1/GCA_027937225.1_ASM2793722v1_protein.faa.gz"
gunzip "GCA_027937225.1_ASM2793722v1_protein.faa.gz"
mv GCA_027937225.1_ASM2793722v1_protein.faa HSV1_San-Francisco-USA-1982-H193-BB_gene_annotated_genome.fasta
samtools faidx HSV1_San-Francisco-USA-1982-H193-BB_gene_annotated_genome.fasta
jbrowse add-assembly HSV1_San-Francisco-USA-1982-H193-BB_gene_annotated_genome.fasta --out $APACHE_ROOT/jbrowse2 --load copy

echo "Downloading gene annotated human alphaherpesirus 1 B^3x1.1B variant genome..."
wget "https://ftp.ncbi.nlm.nih.gov/genomes/all/GCA/027/937/005/GCA_027937005.1_ASM2793700v1/GCA_027937005.1_ASM2793700v1_protein.faa.gz"
gunzip "GCA_027937005.1_ASM2793700v1_protein.faa.gz"
mv GCA_027937005.1_ASM2793700v1_protein.faa HSV1_B3x11B_gene_annotated_genome.fasta
samtools faidx HSV1_B3x11B_gene_annotated_genome.fasta
jbrowse add-assembly HSV1_B3x11B_gene_annotated_genome.fasta --out $APACHE_ROOT/jbrowse2 --load copy

echo "Downloading gene annotated human alphaherpesirus 1 HSV-H1312 variant genome..."
wget "https://ftp.ncbi.nlm.nih.gov/genomes/all/GCA/027/936/485/GCA_027936485.1_ASM2793648v1/GCA_027936485.1_ASM2793648v1_protein.faa.gz"
gunzip "GCA_027936485.1_ASM2793648v1_protein.faa.gz"
mv GCA_027936485.1_ASM2793648v1_protein.faa HSV1_HSV-H1312_gene_annotated_genome.fasta
samtools faidx HSV1_HSV-H1312_gene_annotated_genome.fasta
jbrowse add-assembly HSV1_HSV-H1312_gene_annotated_genome.fasta --out $APACHE_ROOT/jbrowse2 --load copy

###########################################################
####Downloading gff annotation files

echo "Downloading HSV-1 annotations..."
wget "https://ftp.ncbi.nlm.nih.gov/genomes/all/GCF/000/859/985/GCF_000859985.2_ViralProj15217/GCF_000859985.2_ViralProj15217_genomic.gff.gz" # https://ftp.ncbi.nlm.nih.gov/genomes/all/GCA_000857725.1/HSV1_genome.gff"
gunzip "GCF_000859985.2_ViralProj15217_genomic.gff.gz"
jbrowse sort-gff GCF_000859985.2_ViralProj15217s_genomic.gff | bgzip > HSV1_annotations.gff.gz
tabix HSV1_annotations.gff.gz
jbrowse add-track HSV1_annotations.gff.gz --assemblyNames HSV1_genome --out $APACHE_ROOT/jbrowse2 --load copy


echo "Downloading HSV-2 annotations..."
wget "https://ftp.ncbi.nlm.nih.gov/genomes/all/GCA/027/936/235/GCA_027936235.1_ASM2793623v1/GCA_027936235.1_ASM2793623v1_genomic.gff.gz"
gunzip "GCA_027936235.1_ASM2793623v1_genomic.gff.gz"
jbrowse sort-gff GCA_027936235.1_ASM2793623v1_genomic.gff | bgzip > HSV2_annotations.gff.gz
tabix HSV2_annotations.gff.gz
jbrowse add-track HSV2_annotations.gff.gz --assemblyNames HSV2_genome --out $APACHE_ROOT/jbrowse2 --load copy

echo "Downloading HSV-3 annotations..."
wget "https://ftp.ncbi.nlm.nih.gov/genomes/all/GCF/000/858/285/GCF_000858285.1_ViralProj15198/GCF_000858285.1_ViralProj15198_genomic.gff.gz"
gunzip "GCF_000858285.1_ViralProj15198_genomic.gff.gz"
jbrowse sort-gff GCF_000858285.1_ViralProj15198_genomic.gff | bgzip > HSV3_annotations.gff.gz
tabix HSV3_annotations.gff.gz
jbrowse add-track HSV3_annotations.gff.gz --assemblyNames HSV3_genome --out $APACHE_ROOT/jbrowse2 --load copy

echo "Downloading HSV-4 annotations..."
wget "https://ftp.ncbi.nlm.nih.gov/genomes/all/GCF/002/402/265/GCF_002402265.1_ASM240226v1/GCF_002402265.1_ASM240226v1_genomic.gff.gz"
gunzip "GCF_002402265.1_ASM240226v1_genomic.gff.gz"
jbrowse sort-gff GCF_002402265.1_ASM240226v1_genomic.gff | bgzip > HSV4_annotations.gff.gz
tabix HSV4_annotations.gff.gz
jbrowse add-track HSV4_annotations.gff.gz --assemblyNames HSV4_genome --out $APACHE_ROOT/jbrowse2 --load copy

echo "Downloading HSV-7 annotations..."
wget "https://ftp.ncbi.nlm.nih.gov/genomes/all/GCF/000/848/125/GCF_000848125.1_ViralProj14625/GCF_000848125.1_ViralProj14625_genomic.gff.gz"
gunzip "GCF_000848125.1_ViralProj14625_genomic.gff.gz"
jbrowse sort-gff GCF_000848125.1_ViralProj14625_genomic.gff | bgzip > HSV7_annotations.gff.gz
tabix HSV7_annotations.gff.gz
jbrowse add-track HSV7_annotations.gff.gz --assemblyNames HSV7_genome --out $APACHE_ROOT/jbrowse2 --load copy

echo "Downloading HSV-8 annotations..."
wget "https://ftp.ncbi.nlm.nih.gov/genomes/all/GCF/000/838/265/GCF_000838265.1_ViralProj14158/GCF_000838265.1_ViralProj14158_genomic.gff.gz"
gunzip "GCF_000838265.1_ViralProj14158_genomic.gff.gz"
jbrowse sort-gff GCF_000838265.1_ViralProj14158_genomic.gff | bgzip > HSV8_annotations.gff.gz
tabix HSV8_annotations.gff.gz
jbrowse add-track HSV8_annotations.gff.gz --assemblyNames HSV8_genome --out $APACHE_ROOT/jbrowse2 --load copy

################ Annotations for HSV1 strains
### strain: HSV1-San-Francisco-USA-1982-H193-BB
echo "Downloading HSV1 strain annotations..."
wget "https://ftp.ncbi.nlm.nih.gov/genomes/all/GCA/027/937/225/GCA_027937225.1_ASM2793722v1/GCA_027937225.1_ASM2793722v1_genomic.gff.gz"
gunzip "GCA_027937225.1_ASM2793722v1_genomic.gff.gz"
jbrowse sort-gff GCA_027937225.1_ASM2793722v1_genomic.gff | bgzip > HSV1_San-Francisco-USA-1982-H193-BB_annotations.gff.gz
tabix HSV1_San-Francisco-USA-1982-H193-BB_annotations.gff.gz
jbrowse add-track HSV1_San-Francisco-USA-1982-H193-BB_annotations.gff.gz --assemblyNames HSV1_San-Francisco-USA-1982-H193-BB --out $APACHE_ROOT/jbrowse2 --load copy

### strain: B^3x1.1B
wget "https://ftp.ncbi.nlm.nih.gov/genomes/all/GCA/027/937/005/GCA_027937005.1_ASM2793700v1/GCA_027937005.1_ASM2793700v1_genomic.gff.gz"
gunzip "GCA_027937005.1_ASM2793700v1_genomic.gff.gz"
jbrowse sort-gff GCA_027937005.1_ASM2793700v1_genomic.gff | bgzip > HSV1_B3x11B_annotations.gff.gz
tabix HSV1_B3x11B_annotations.gff.gz
jbrowse add-track HSV1_B3x11B_annotations.gff.gz --assemblyNames HSV1_B3x11B --out $APACHE_ROOT/jbrowse2 --load copy

### strain: HSV-H1312
wget "https://ftp.ncbi.nlm.nih.gov/genomes/all/GCA/027/936/485/GCA_027936485.1_ASM2793648v1/GCA_027936485.1_ASM2793648v1_genomic.gff.gz"
gunzip "GCA_027936485.1_ASM2793648v1_genomic.gff.gz"
jbrowse sort-gff GCA_027936485.1_ASM2793648v1_genomic.gff | bgzip > HSV1_HSV-H1312_annotations.gff.gz
tabix HSV1_HSV-H1312_annotations.gff.gz
jbrowse add-track HSV1_HSV-H1312_annotations.gff.gz --assemblyNames HSV1_HSV-H1312 --out $APACHE_ROOT/jbrowse2 --load copy

### strain: F
wget "https://ftp.ncbi.nlm.nih.gov/genomes/all/GCA/027/937/465/GCA_027937465.1_ASM2793746v1/GCA_027937465.1_ASM2793746v1_genomic.gff.gz"
gunzip "GCA_027937465.1_ASM2793746v1_genomic.gff.gz"
jbrowse sort-gff GCA_027937465.1_ASM2793746v1_genomic.gff | bgzip > HSV1_F_annotations.gff.gz
tabix HSV1_F_annotations.gff.gz
jbrowse add-track HSV1_F_annotations.gff.gz --assemblyNames HSV1_F --out $APACHE_ROOT/jbrowse2 --load copy



# ##### Add index for search-by-gene into jbrowse
jbrowse text-index --out $APACHE_ROOT/jbrowse2



# echo "Setup complete! Run JBrowse2 with the following command:"
# # # echo "cd jbrowse2 && jbrowse serve"

