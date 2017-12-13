#!/bin/bash

# path to the repo from which this script was executed
CURRENT_REPO=$(dirname $(dirname $(readlink -f $0)))

# name used for VIM env builded with this script
VIM_NAME=vim8

VIM_SOURCE=https://github.com/vim/vim.git

VIM_INSTALL_DIR=~/.vim-install
VIM_BUILD_DIR=$VIM_INSTALL_DIR/vim-build/

VIM_TARGET_DIR=~/app/$VIM_NAME

VIMRC_DEF_LOC=~/.vimrc
DOTVIM_DEF_LOC=~/.vim

VIMRC_BAC_LOC=~/.vimrc.bac
DOTVIM_BAC_LOC=~/.vim.bac

DOTVIM_TARGET_DIR=~/dotfiles

# try to use python 3.5, required python-dev package
PYTHON_3_CONFIG=/usr/bin/python3.5-config

#
# FLAGS
#

DEBUG_FLAG=false

GET_VIM_FLAG=false
BUILD_VIM_FLAG=false
DEPLOY_VIM_FLAG=false
UPDATE_VIM_CFG_FLAG=false

print_help()
{
  echo "Usage: `basename $0` <params>"
  echo ""
  echo "Supported parameters:"
  echo "  --debug - prints debug info without executing any action"
  echo "  --python-config <file> - path to python-config file"
  echo "  --get-vim - clones VIM repository from GitHub to installation directory"
  echo "  --build-vim - build VIM from sources"
  echo "  --deploy-vim - copies build VIM binaries to target directory"
  echo "  --update-vim-cfg - copies vim configs to target cfg dir"
}

# parsing command line arguments
while [ $# -gt 0 ]; do
  case $1 in
    --help)
      print_help
      exit;;
    -pc|--python-config)
      shift
      PYTHON_3_CONFIG=$1
      shift
      ;;
    --debug)
      DEBUG_FLAG=true
      shift
      ;;
    --get-vim)
      GET_VIM_FLAG=true
      shift
      ;;
    --build-vim)
      BUILD_VIM_FLAG=true
      shift
      ;;
    --deploy-vim)
      DEPLOY_VIM_FLAG=true
      shift
      ;;
    --update-vim-cfg)
      UPDATE_VIM_CFG_FLAG=true
      shift
      ;;
    *)
      echo "Unsupported parameter $1"
      exit 1
  esac
done

if [ "$DEBUG_FLAG" = true ]; then
  echo "DEBUG MODE"
  echo ""
  echo "VIM source : $VIM_SOURCE"
  echo "VIM target dir : $VIM_TARGET_DIR"
  echo ".VIM target dir : $DOTVIM_TARGET_DIR"
  echo ""
  echo "Python config file : $PYTHON_3_CONFIG"
  echo ""

  tasks=""
  if [ "$GET_VIM_FLAG" = true ]; then
    tasks+="[GET-VIM]"
  fi
  if [ "$BUILD_VIM_FLAG" = true ]; then
    tasks+="[BUILD-VIM]"
  fi
  if [ "$DEPLOY_VIM_FLAG" = true ]; then
    tasks+="[DEPLOY-VIM]"
  fi
  if [ "$UPDATE_VIM_CFG_FLAG" = true ]; then
    tasks+="[UPDATE-VIM-CFG]"
  fi

  echo "Tasks: $tasks"

  exit 0
fi

# configure parameters to be checked
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

# Builds VIM in temporary location
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

# Copies build VIM to target location
deployVim()
{
  if [ -d $VIM_TARGET_DIR ]; then
    echo "Target VIM location exists, will be overridden"
    rm -rf $VIM_TARGET_DIR
  fi

  mkdir $VIM_TARGET_DIR

  cp -R $VIM_BUILD_DIR/* $VIM_TARGET_DIR

  echo "Build VIM copied to target location $VIM_TARGET_DIR"
}

# Copies dot VIM directory to target location
# Updates .vim and .vimrc symlink to new target
# Creates backup files *.bac if they don't exist
updateVimConfigs()
{
  # check if parent directory exists
  if [ ! -d $DOTVIM_TARGET_DIR ]; then
    mkdir $DOTVIM_TARGET_DIR
  fi

  if [ -d $DOTVIM_TARGET_DIR/$VIM_NAME ]; then
    echo "Dot VIM already exists in requested location, override : $DOTVIM_TARGET_DIR/$VIM_NAME"
    rm -rf $DOTVIM_TARGET_DIR/$VIM_NAME
  fi

  mkdir $DOTVIM_TARGET_DIR/$VIM_NAME

  echo "Dot VIM copied to $DOTVIM_TARGET_DIR/$VIM_NAME"
  cp -R $CURRENT_REPO/vim/* $DOTVIM_TARGET_DIR/$VIM_NAME

  # create symlink to .vim in home directory
  if [[ -L $DOTVIM_DEF_LOC ]]; then
    echo "Dot VIM already exists and is a symbolic link to `readlink $DOTVIM_DEF_LOC`"

    # create a backup symlink only if the existing link points to different location then
    # the one that is being created
    if [ ! `readlink $DOTVIM_DEF_LOC` -ef $DOTVIM_TARGET_DIR/$VIM_NAME ]; then
      if [ -L $DOTVIM_BAC_LOC ]; then
        echo "Backup dot VIM symlink already exists, no new backup will be created"
      else
        echo "Backup dot VIM symlink created $DOTVIM_BAC_LOC -> `readlink $DOTVIM_DEF_LOC`"
        ln -s `readlink $DOTVIM_DEF_LOC` $DOTVIM_BAC_LOC
      fi
    else
      echo "Dot VIM symlink already points to target location"
    fi

    unlink $DOTVIM_DEF_LOC
  fi

  # FIXME handling if .vim is a normal directory

  echo "Dot VIM symlink created $DOTVIM_DEF_LOC -> $DOTVIM_TARGET_DIR/$VIM_NAME"
  ln -s $DOTVIM_TARGET_DIR/$VIM_NAME $DOTVIM_DEF_LOC

  # create symlink to .vimrc in home directory
  if [[ -L $VIMRC_DEF_LOC ]]; then
    echo "Dot VIMRC already exists and is a symbolic link to `readlink $VIMRC_DEF_LOC`"

    # create a backup symlink only if the existing link points to different location then
    # the one that is being created
    if [ ! `readlink $VIMRC_DEF_LOC` -ef $DOTVIM_TARGET_DIR/$VIM_NAME/vimrc/vimrc ]; then
      if [ -L $VIMRC_BAC_LOC ]; then
        echo "Backup dot VIMRC symlink already exists, no new backup will be created"
      else
        echo "Backup dot VIMRC symlink created $VIMRC_BAC_LOC -> `readlink $VIMRC_DEF_LOC`"
        ln -s `readlink $VIMRC_DEF_LOC` $VIMRC_BAC_LOC
      fi
    else
      echo "Dot VIMRC symlink already points to target location"
    fi

    unlink $VIMRC_DEF_LOC
  fi

  # FIXME handling if .vimrc is a normal file

  echo "Dot VIMRC symlink created $VIMRC_DEF_LOC -> $DOTVIM_TARGET_DIR/$VIM_NAME/vimrc/vimrc"
  ln -s $DOTVIM_TARGET_DIR/$VIM_NAME/vimrc/vimrc $VIMRC_DEF_LOC
}

################################################################################
#
# Execute requested actions
#
################################################################################

if [ "$GET_VIM_FLAG" = true ]; then
  getVim
fi
if [ "$BUILD_VIM_FLAG" = true ]; then
  buildVim
fi
if [ "$DEPLOY_VIM_FLAG" = true ]; then
  deployVim
fi
if [ "$UPDATE_VIM_CFG_FLAG" = true ]; then
  updateVimConfigs
fi

