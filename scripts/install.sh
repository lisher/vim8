#!/bin/bash

VIM_SOURCE=https://github.com/vim/vim.git

VIM_INSTALL_DIR=~/.vim-install
VIM_BUILD_DIR=$VIM_INSTALL_DIR/vim-build/

VIM_TARGET_DIR=~/app/vim8/

# try to use python 3.5, required python-dev
PYTHON_3_CONFIG=/usr/bin/python3.5-config

# for ruby ruby-dev needed

#--with-x \
#--enable-fail-if-missing \
# VIM_CONFIGURE_OPTIONS=" \
# --enable-multibyte \
# --with-features=huge \
# --enable-pythoninterp \
# --enable-python3interp \
# --enable-rubyinterp \
# --enable-perlinterp \
# --enable-gui=auto \
# --enable-cscope \
# --enable-largefile \
# --with-python3-config-dir=`$PYTHON_3_CONFIG --configdir` \
# --prefix=$VIM_BUILD_DIR"

buildVimConfig()
{
  echo "Building VIM configure options"

  # default options, should always be available
  VIM_CONFIGURE_OPTIONS=" \
--enable-multibyte \
--with-features=huge \
--enable-gui=auto \
--enable-cscope \
--enable-largefile \
--prefix=$VIM_BUILD_DIR"

  # Python 3.5 suppoer
  if [ ! -d $PYTHON_3_5_CONFIG ]; then
    echo "Unable to find python 3 config $PYTHON_3_CONFIG"
  else
    VIM_CONFIGURE_OPTIONS+=" --enable-python3interp "
    VIM_CONFIGURE_OPTIONS+=" --with-python3-config-dir=`$PYTHON_3_CONFIG --configdir` "
  fi

  # Python 2 support
  VIM_CONFIGURE_OPTIONS+=" --enable-pythoninterp "

  # Ruby support
  VIM_CONFIGURE_OPTIONS+=" --enable-rubyinterp "

  # Perl support
  VIM_CONFIGURE_OPTIONS+=" --enable-perlinterp "

  echo $VIM_CONFIGURE_OPTIONS
}

getVim()
{
  # cleanup old install dir
  # if this directory exists previous installation most likely failed
  if [ -d $VIM_INSTALL_DIR ]; then
    echo "Removing old content from install dir $VIM_INSTALL_DIR"
    rm -rf $VIM_INSTALL_DIR
  fi

  mkdir $VIM_INSTALL_DIR

  cd $VIM_INSTALL_DIR

  echo "Cloning VIM sources from $VIM_SOURCE"

  git clone $VIM_SOURCE

  echo "VIM sources stored in $PWD"

  cd -

}

buildVim()
{
  if [ ! -d $VIM_INSTALL_DIR/vim ]; then
    echo "Missing directory with VIM source : $VIM_INSTALL_DIR/vim"
    exit 1
  fi

  cd $VIM_INSTALL_DIR/vim

  echo "Building VIM"
  echo

  make distclean

  VIM_CONFIGURE_OPTIONS=$(buildVimConfig)

  echo "./configure $VIM_CONFIGURE_OPTIONS"
  ./configure $VIM_CONFIGURE_OPTIONS

  make
  make install

  if [ $? -eq 0 ]; then
    echo
    echo "VIM build success $VIM_INSTALL_DIR/vim"
    cd - > /dev/null
    return 0
  else
    echo
    echo "VIM build failed"
    cd - &>/dev/null
    return 1
  fi

}

getVim
buildVim


