<div align="center"><img src="https://raw.github.com/tumregels/asciiviewer/master/asciiviewer/assets/splash.png?raw=true" alt="asciiviewer logo" width="128" /></div>
<h1 align="center">asciiviewer</h1>

![Build](https://github.com/tumregels/asciiviewer/workflows/Build/badge.svg?branch=master)
[![License: GPL v3](https://img.shields.io/badge/License-GPLv3-blue.svg)](https://www.gnu.org/licenses/gpl-3.0)

<div align="center"><img src="https://raw.github.com/tumregels/asciiviewer/master/images/preview.png?raw=true" alt="asciiviewer preview" width="700" /></div>

A pretty viewer for XSM files generated by DRAGON/DONJON or APOLLO neutronic codes

## Demo

<details>
<summary>Linux</summary>
<div align="center">
<img src="https://raw.github.com/tumregels/asciiviewer/master/images/linux.gif?raw=true" alt="linux demo" width="700" />
</div>
</details>

<details open>
<summary>Windows</summary>
<div align="center">
<img src="https://raw.github.com/tumregels/asciiviewer/master/images/windows.gif?raw=true" alt="windows demo" width="700" />
</div>
</details>

<details>
<summary>Macos</summary>
<div align="center">
<img src="https://raw.github.com/tumregels/asciiviewer/master/images/macos.gif?raw=true" alt="macos demo" width="700" />
</div>
</details>

## About

As a DRAGON/DONJON user, you want to look inside a `LCM` object, such as
`LINKED_LIST`, `SEQ_ASCII` or `XSM_FILE`.
The simplest way to do this is to convert your object into `XSM_FILE` or `SEQ_ASCII` format

    SEQ_ASCII mySeqFile ; mySeqFile := myLCMObject ;

perform calculation and open the resulting output file with __asciiviewer__.

The initial version of __asciiviewer__ was written by Benjamin Toueg in 2009
and is available [here](http://code.google.com/p/dragon-donjon-ascii-viewer/).

Here, the original source code was ported to run on both python 2 and 3 with [wxpython 4](https://www.wxpython.org/).
Single file executables are generated with [pyinstaller](https://www.pyinstaller.org/) using [these workflows](.github/workflows)
via [github actions](https://github.com/tumregels/asciiviewer/actions).

## Installation

The easiest way to run __asciiviewer__
is to download the executable from [releases](https://github.com/tumregels/asciiviewer/releases/latest)
as shown in the [demo](#demo).
Otherwise set it up [manually](#manual-setup).

### Manual setup

First step is to install [miniconda](https://repo.continuum.io/miniconda/Miniconda3-latest-Linux-x86_64.sh)

    $ wget https://repo.continuum.io/miniconda/Miniconda3-latest-Linux-x86_64.sh -O ~/miniconda3.sh
    $ bash ~/miniconda3.sh -bfp ~/miniconda3
    $ rm -f ~/miniconda3.sh
    $ echo 'export PATH="$PATH:$HOME/miniconda3/bin"' >> ~/.bashrc

Then git clone the __asciiviewer__ project and create conda environment for the project

    $ git clone https://github.com/tumregels/asciiviewer
    $ cd asciiviewer
    $ conda env create -f environment.yml

Now activate the conda environment and run `asciiviewer` command

    $ source activate asciiviewer
    (asciiviewer) $ asciiviewer

or with python

    (asciiviewer) $ python asciiviewer/main.py

To open the DRAGON/DONJON output file from the command line

    (asciiviewer) $ asciiviewer ./path/to/file

To generate the single file executable on your computer

    (asciiviewer) $ pyinstaller --clean --noconfirm ./asciiviewer.spec

The executable can be found under `dist` folder.

__Important__ - single file executables can be called from terminal with or without file path

    $ ./asciiviewer ./path/to/file

## Issues

Please report any problems or bugs [here](https://github.com/tumregels/asciiviewer/issues)

### Known issues

* The __asciiviewer__ executables are not signed and you will get warnings on Macos and Windows.
  Please note that all files under [releases](https://github.com/tumregels/asciiviewer/releases) are
  generated on github servers via [github actions](https://github.com/tumregels/asciiviewer/actions).

* The program may crash unexpectedly when used with big files.

* On ubuntu, during manual setup you may get `missing libgtk-x11-2.0.so.0` error.
  One solution is to reinstall `libgtk2.0` library

      $ sudo apt-get install --reinstall libgtk2.0-0
