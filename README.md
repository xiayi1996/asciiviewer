# asciiviewer

A pretty viewer for XSM files generated by DRAGON/DONJON or APOLLO neutronic codes

As a DRAGON or DONJON user, you want to look inside a LCM object
(LINKED_LIST, SEQ_ASCII or XSM_FILE).
The simplest way to do this is to convert your object in `XSM_FILE` or `SEQ_ASCII` format :

    XSM_FILE myXsmFile ; myXsmFile := myLCMObject ;

Open the resulting file with __asciiviewer__ and you'll be able to
browse through it thanks to a treeview.

## Development setup

First step is to install [miniconda](https://repo.continuum.io/miniconda/Miniconda3-latest-Linux-x86_64.sh)

    $ wget https://repo.continuum.io/miniconda/Miniconda3-latest-Linux-x86_64.sh -O ~/miniconda3.sh
    $ bash ~/miniconda3.sh -bfp ~/miniconda3
    $ rm -f ~/miniconda3.sh
    $ echo 'export PATH="$PATH:$HOME/miniconda3/bin"' >> ~/.bashrc

Then git clone the asciiviewer project and create conda environment for the project

    $ git clone https://github.com/tumregels/asciiviewer
    $ cd asciiviewer
    $ conda env create -f environment.yml

Now activate the conda environment and run the program

    $ source activate asciiviewer
    (asciiviewer) $ python asciiviewer/main.py

If you get `missing libgtk-x11-2.0.so.0` error,
try to reinstall `libgtk2.0` library

    $ sudo apt-get install --reinstall libgtk2.0-0
