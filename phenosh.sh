#!/bin/sh

function ph_nlinf() {
  echo '' >> $1
}

function ph_makebashfile() {
  touch $1.sh
  echo '#/bin/sh' >> $1.sh
  echo '' >> $1.sh
}

function ph_awrt() {
  echo '${2}' >> $1
}

function ph_aliastr() {
  return $(('alias ${1}=\'${2}\''))
}

ph_makebashfile phenoclone
ph_makebashfile phenocloner
ph_makebashfile phenon
ph_awrt phenoclone.sh $(ph_aliastr phenoclone 'sh phenocloner.sh')
ph_awrt phenocloner.sh 'git clone https://github.com/$1/$2.git'
ph_awrt phenon.sh 'source phenoclone.sh'
ph_nlinf phenon.sh
ph_awrt phnon.sh $(ph_aliastr phenon 'sh phenoclone.sh Phenol0000-0000')