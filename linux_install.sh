#### These commands will install paprica and all its dependencies on Linux. ####
#### They assume nothing other than a base Debian-style Linux installation  ####
#### (e.g. one that uses apt-get).  These commands will not work as-is for  ####
#### OSX, although they will serve as a useful guide for installation on    ####
#### OSX.  Refer to the tutorial at:                                        ####
#### http://www.polarmicrobes.org/installing-paprica-on-mac-osx/.           #### 

cd ~

## Install pip
sudo apt-get install python-dev
wget https://bootstrap.pypa.io/ez_setup.py -O - | python - --user
wget http://pypi.python.org/packages/source/p/pip/pip-1.1.tar.gz#md5=62a9f08dd5dc69d76734568a6c040508
tar -xvf pip*.gz
cd pip*
sudo python setup.py install

## Install some packages
cd ~
sudo apt-get install build-essential
sudo apt-get install git
sudo apt-get install zip

## Install python dependencies, including external python tools
sudo pip install numpy
sudo pip install biopython
sudo pip install parallel
sudo apt-get install python-pandas
sudo pip install seqmagick

## Install RAxML
git clone https://github.com/stamatak/standard-RAxML.git
cd standard-RAxML
sudo make -f Makefile.AVX2.PTHREADS.gcc
rm -f *.o

## Install infernal
wget http://eddylab.org/infernal/infernal-1.1.2-linux-intel-gcc.tar.gz
tar -xzvf infernal-1.1.2-linux-intel-gcc.tar.gz
mv infernal-1.1.2-linux-intel-gcc infernal

## Install pplacer
wget https://github.com/matsen/pplacer/releases/download/v1.1.alpha18/pplacer-linux-v1.1.alpha18-2-gcb55169.zip
unzip pplacer-linux-v1.1.alpha18-2-gcb55169.zip
mv pplacer-Linux-v1.1.alpha18-2-gcb55169 pplacer

## Modify PATH in .bashrc
echo "## added by paprica installer" >> .bashrc
echo "PATH=/home/${user}/pplacer:$PATH" >> .bashrc
echo "PATH=/home/${user}/infernal/binaries:$PATH" >> .bashrc
echo "PATH=/home/${user}/infernal/easel:$PATH" >> .bashrc
echo "PATH=/home/${user}/standard-RAxML:$PATH" >> .bashrc
echo "PATH=/home/${user}/paprica:$PATH" >> .bashrc
source .bashrc

## Download paprica - redundant cause that's probably how you got this script
git clone https://github.com/bowmanjeffs/paprica.git
cd paprica
chmod a+x *py
chmod a+x *sh


