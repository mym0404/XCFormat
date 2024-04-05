#!/bin/bash

# code sign for app store

codesign --force --sign BBF30A41EB75059016C20941979473288D4F3C3D --entitlements ../SourceExtension/Binary.entitlements $1
