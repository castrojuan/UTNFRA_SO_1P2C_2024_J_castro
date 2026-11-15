#!/bin/bash

GRUPO=$(id -Gn $1 | awk '{print $2}')

mkdir -p /P_Defensa

useradd -m -g $GRUPO -d /P_Defensa/UDef_Castro UDef_Castro



