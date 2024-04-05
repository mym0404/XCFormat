#!/bin/bash

# undo code sign for debug

codesign --force --sign BBF30A41EB75059016C20941979473288D4F3C3D $1
