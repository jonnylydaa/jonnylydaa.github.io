# herpdb
---- 
### *Herpesvirus database installer*

Quick start guides for setting up Jbrowse 2 can be found at https://jbrowse.org/jb2/docs/

Following the link at "Quick start for JBrowse web - a quick start guide to running JBrowse 2 in a browser" will take you to directions on installing Jbrowse 2 and all of its dependencies.

This guide is also helpful for Jbrowse 2 setup: https://currentprotocols.onlinelibrary.wiley.com/doi/10.1002/cpz1.1120 


Otherwise, you can follow this guide to setup Jbrowse 2 and this database installer for your system:

## Before Setting up Jbrowse 2


Install brew using the bash script from https://brew.sh/. 
```
/bin/bash -c "$(curl -fsSL https://raw.githubusercontent.com/Homebrew/install/HEAD/install.sh)"
```

After this is complete, add brew to your execution path:
```
echo >> /home/ubuntu/.bashrc
echo 'eval "$(/home/linuxbrew/.linuxbrew/bin/brew shellenv)"' >> /home/ubuntu/.bashrc
eval "$(/home/linuxbrew/.linuxbrew/bin/brew shellenv)"
```

## Install necessary tools
Following the quick start guide install Node.js, @jbrowse/cli, wget, apache2, samtools, tabix, htslib



## Start the apache2 server

Start the apache2 server

## Create APACHE_ROOT path

For a normal linux installation, the folder should be `/var/www` or `/var/www/html`, whereas when you install on macOS using brew it will likely be in `/opt/homebrew/var/www` (for M1) or `/usr/local/var/www` (for Intel). You can run `brew --prefix` to get the brew install location, and then from there it is in the `var/www` folder. 

Verify that one of these folders exists (it should currently be empty, except possibly for an index file, but we will now populate it with JBrowse 2). If you have e.g. a www folder with no www/html folder, and your web server is showing the "It works!" message, you can assume that the www one is the root directory. 

Take note of what the folder is, and use the command below to store it as a command-line variable. We can reference this variable in the rest of our code, to save on typing. You will need to re-run the `export` if you restart your terminal session!
```
# be sure to replace the path with your actual true path!
export APACHE_ROOT='/path/to/rootdir'
```

If you are really struggling to find the APACHE_ROOT folder, you could try searching for it.
```
sudo find / -name "www" 2>/dev/null
```
## Get the host
If you are running locally on your mac, the hostname is just `localhost`. However, for WSL and AWS, you will need to do a bit of work to find the right ip address.
For local hosting, the url will be `http://localhost:8080/` or `http://XX.XXX.XXX.XX:8080/`, where Xs are replaced with the appropriate IP address from the WSL steps below.

#### WSL
```
# from within WSL, run the linux server launch command to launch the service, then print out you WSL IP address so you can access the server from your Windows browser
# if the ip command isn't recognized, install iproute and then try again
# sudo apt install iproute2
ip addr show eth0 | grep "inet\b" | awk '{print $2}' | cut -d/ -f1
```
This should give you an ip address you can use to access the web server.

#### AWS
In your instance summary page, there should be an "auto-assigned IP address." Your web server can be accessed at `http://ipaddress`. You don't need to provide a port.

### Access the web server
Open a browser and type the appropriate url into the address bar. You should then get to a page that says "**It works!**" (for AWS there may be some additional info). If you have trouble accessing the server, you can try checking your firewall settings and disabling any VPNs or proxies to make sure traffic to localhost is allowed.


### Download JBrowse 2


### Test your jbrowse install
In your browser, now type in `http://yourhost/jbrowse2/`, where yourhost is either localhost or the IP address from earlier. Now you should see the words "**It worked!**" with a green box underneath saying "JBrowse 2 is installed." with some additional details. 

## Clone Github

Clone this repository in the directory of your choice: ```git clone https://github.com/jonnylydaa/herpdb.git```

run ```bash append_msaview_plugin.sh``` in your terminal. 

***Note that $APACHE_ROOT/jbrowse2 must have the path to your jbrowse2 folder***

Now run ```bash setup.sh```
This will get all of the data files installed on your computer and put into Jbrowse 2.

## Go to Jbrowse 2 webpage

This is a static github pages website. If you wanted your own instance of Jbrowse 2 displaying the data from herpdb, you would need to go to `http://yourhost/jbrowse2/` (as said above) after you have set up Jbrowse 2 on your system. This is the end of the quick start guide on setting up Jbrowse 2 mentioned at the beginning.

**Github Pages:** Go to https://jonnylydaa.github.io/jbrowse2 for the homepage of herpdb Jbrowse 2 instance 

Alternatively, Go to https://jonnylydaa.github.io/jbrowse2/?session=share-ilMRaDs6hw&password=YMEUX to see pre-loaded data displayed. 

On the pre-loaded data jbrowse 2 webpage, The first view (MsaView) is showing the relationshuips of 5 Human Alphaherpesvirus genomes that have undergone multiple sequence alignment. These 5 HSV1 variants will be installed when ```bash setup.sh``` is ran. These variants are: `HSV1_genome, HSV1_San-Francisco-USA-1982-H193-BB, HSV1_HSV-H1312, HSV1_F, and HSV1_B3x11B`. The MsaView of these 5 HSV1 variants (really 4 variants and 1 reference) are displayed from `HSV1_variant_alignment_clustalo.aln-stockholm`, which was generated using Clustal Omega (https://www.ebi.ac.uk/jdispatcher/msa/clustalo?outfmt=stockholm&stype=dna) by giving Clustal Omega a concatenated fasta file with all variant amino acid sequences. The MsaView display used `HSV1_variants_clustalo.phylotree` to visualize the phylogenetic tree of all of the variants which was also generated using Clustal Omega with the same instructions. 

`HSV1_variant_alignment_clustalo.aln-stockholm`, `HSV1_variants_clustalo.phylotree`, and `HSV1_variants_percent_identity_matrix_clustalo.pim` can be found in the `precomputed_files` directory. 

`HSV1_variants_percent_identity_matrix_clustalo.pim` is not being used by Jbrowse 2 but is a good user reference. 

#### Debugging
In case there are any issues with Jbrowse 2 or the MsaView plugin, you are able to download MsaView from the plugin store by opening a new session, clicking on `tools` in the top left corner, clicking on `plugin store`, and installing MsaView there. This will install MsaView for the exact instance you are running. 

Additionally, you can open up a MsaView view and input the `HSV1_variant_alignment_clustalo.aln-stockholm` file (Url is: https://raw.githubusercontent.com/jonnylydaa/herpdb/6bc637c4f9805606d1ff557199c1505edbfeb673/precomputed_files/HSV1_variant_alignment_clustalo.aln-stockholm) into the first file entry (alignment file) and then you can input `HSV1_variants_clustalo.phylotree` (Url is: https://raw.githubusercontent.com/jonnylydaa/herpdb/6bc637c4f9805606d1ff557199c1505edbfeb673/precomputed_files/HSV1_variants_clustalo.phylotree) into the second file entry (tree file). 

This will allow MsaView to display the data within these files in the chance that the pre-loaded Jbrowse 2 instance is not working correctly.

## References

HSV-1: https://ftp.ncbi.nlm.nih.gov/genomes/all/GCF/000/859/985/GCF_000859985.2_ViralProj15217/GCF_000859985.2_ViralProj15217_genomic.fna.gz
https://ftp.ncbi.nlm.nih.gov/genomes/all/GCF/000/859/985/GCF_000859985.2_ViralProj15217/GCF_000859985.2_ViralProj15217_protein.faa.gz
https://ftp.ncbi.nlm.nih.gov/genomes/all/GCF/000/859/985/GCF_000859985.2_ViralProj15217/GCF_000859985.2_ViralProj15217_genomic.gff.gz

HSV-2:
https://ftp.ncbi.nlm.nih.gov/genomes/all/GCA/027/936/235/GCA_027936235.1_ASM2793623v1/GCA_027936235.1_ASM2793623v1_genomic.fna.gz
https://ftp.ncbi.nlm.nih.gov/genomes/all/GCA/027/936/235/GCA_027936235.1_ASM2793623v1/GCA_027936235.1_ASM2793623v1_genomic.gff.gz

HSV-3: 
https://ftp.ncbi.nlm.nih.gov/genomes/all/GCF/000/858/285/GCF_000858285.1_ViralProj15198/GCF_000858285.1_ViralProj15198_genomic.fna.gz
https://ftp.ncbi.nlm.nih.gov/genomes/all/GCF/000/858/285/GCF_000858285.1_ViralProj15198/GCF_000858285.1_ViralProj15198_genomic.gff.gz

HSV-4:
https://ftp.ncbi.nlm.nih.gov/genomes/all/GCF/002/402/265/GCF_002402265.1_ASM240226v1/GCF_002402265.1_ASM240226v1_genomic.fna.gz
https://ftp.ncbi.nlm.nih.gov/genomes/all/GCF/002/402/265/GCF_002402265.1_ASM240226v1/GCF_002402265.1_ASM240226v1_genomic.gff.gz

HSV-7:
https://ftp.ncbi.nlm.nih.gov/genomes/all/GCF/000/848/125/GCF_000848125.1_ViralProj14625/GCF_000848125.1_ViralProj14625_genomic.fna.gz
https://ftp.ncbi.nlm.nih.gov/genomes/all/GCF/000/848/125/GCF_000848125.1_ViralProj14625/GCF_000848125.1_ViralProj14625_genomic.gff.gz

HSV-8:
https://ftp.ncbi.nlm.nih.gov/genomes/all/GCF/000/838/265/GCF_000838265.1_ViralProj14158/GCF_000838265.1_ViralProj14158_genomic.fna.gz
https://ftp.ncbi.nlm.nih.gov/genomes/all/GCF/000/838/265/GCF_000838265.1_ViralProj14158/GCF_000838265.1_ViralProj14158_genomic.gff.gz

*HSV-1 Variants:*

HSV1-San-Francisco-USA-1982-H193-BB:
https://ftp.ncbi.nlm.nih.gov/genomes/all/GCA/027/937/225/GCA_027937225.1_ASM2793722v1/GCA_027937225.1_ASM2793722v1_genomic.fna.gz
https://ftp.ncbi.nlm.nih.gov/genomes/all/GCA/027/937/225/GCA_027937225.1_ASM2793722v1/GCA_027937225.1_ASM2793722v1_protein.faa.gz
https://ftp.ncbi.nlm.nih.gov/genomes/all/GCA/027/937/225/GCA_027937225.1_ASM2793722v1/GCA_027937225.1_ASM2793722v1_genomic.gff.gz

B^3x1.1B: 
https://ftp.ncbi.nlm.nih.gov/genomes/all/GCA/027/937/005/GCA_027937005.1_ASM2793700v1/GCA_027937005.1_ASM2793700v1_genomic.fna.gz
https://ftp.ncbi.nlm.nih.gov/genomes/all/GCA/027/937/005/GCA_027937005.1_ASM2793700v1/GCA_027937005.1_ASM2793700v1_protein.faa.gz
https://ftp.ncbi.nlm.nih.gov/genomes/all/GCA/027/937/005/GCA_027937005.1_ASM2793700v1/GCA_027937005.1_ASM2793700v1_genomic.gff.gz

HSV-H1312:
https://ftp.ncbi.nlm.nih.gov/genomes/all/GCA/027/936/485/GCA_027936485.1_ASM2793648v1/GCA_027936485.1_ASM2793648v1_genomic.fna.gz
https://ftp.ncbi.nlm.nih.gov/genomes/all/GCA/027/936/485/GCA_027936485.1_ASM2793648v1/GCA_027936485.1_ASM2793648v1_protein.faa.gz
https://ftp.ncbi.nlm.nih.gov/genomes/all/GCA/027/936/485/GCA_027936485.1_ASM2793648v1/GCA_027936485.1_ASM2793648v1_genomic.gff.gz

F: 
https://ftp.ncbi.nlm.nih.gov/genomes/all/GCA/027/937/465/GCA_027937465.1_ASM2793746v1/GCA_027937465.1_ASM2793746v1_genomic.fna.gz
https://ftp.ncbi.nlm.nih.gov/genomes/all/GCA/027/937/465/GCA_027937465.1_ASM2793746v1/GCA_027937465.1_ASM2793746v1_protein.faa.gz
https://ftp.ncbi.nlm.nih.gov/genomes/all/GCA/027/937/465/GCA_027937465.1_ASM2793746v1/GCA_027937465.1_ASM2793746v1_genomic.gff.gz


Clustal Omega: 

```Madeira F, Madhusoodanan N, Lee J, et al. The EMBL-EBI Job Dispatcher sequence analysis tools framework in 2024. Nucleic Acids Research. 2024 Jul;52(W1):W521-W525. DOI: 10.1093/nar/gkae241. PMID: 38597606; PMCID: PMC11223882.```

Jbrowse 2 Installation:

``` Diesh, C.,  Buels, R.,  Stevens, G.,  Bridge, C.,  Cain, S.,  Stein, L., &  Holmes, I. (2024).  Setting up the JBrowse 2 genome browser. Current Protocols,  4, e1120. doi: 10.1002/cpz1.1120```
