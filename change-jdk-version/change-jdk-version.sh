#!/bin/bash

# this has to be defined in .bashrc to have an effect on the calling shell
# 'which' will still report executable found on the PATH

change_java() {
    NEW_JAVA_VERSION=$1;
    export JAVA_HOME=$NEW_JAVA_VERSION
    hash -p "$JAVA_HOME/bin/java" java
    type java
}