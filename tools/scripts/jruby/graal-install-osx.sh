#!/bin/bash

mkdir ~/jruby
cd ~/jruby

git clone https://github.com/graalvm/mx.git
export PATH=$HOME/jruby/mx/:$PATH
export JAVA_HOME=/Users/mch/jruby/labsjdk1.8.0_111-jvmci-0.23/
