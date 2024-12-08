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

