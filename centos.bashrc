#!/bin/bash

if [ "$PS1" ]; then
  complete -cf sudo #为sudo命令设置命令补全
fi
