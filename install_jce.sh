#!/bin/bash
#
# Licensed under the Apache License, Version 2.0 (the "License");
# you may not use this file except in compliance with the License.
# You may obtain a copy of the License at
#
# http://www.apache.org/licenses/LICENSE-2.0
#
# Unless required by applicable law or agreed to in writing, software
# distributed under the License is distributed on an "AS IS" BASIS,
# WITHOUT WARRANTIES OR CONDITIONS OF ANY KIND, either express or implied.
# See the License for the specific language governing permissions and
# limitations under the License.
#
# Copyright Clairvoyant 2015

pushd /tmp
if rpm -q jdk; then
  wget -c --no-cookies --no-check-certificate --header "Cookie: oraclelicense=accept-securebackup-cookie" \
    http://download.oracle.com/otn-pub/java/jce_policy/6/jce_policy-6.zip -O jce_policy-6.zip
  unzip jce_policy-6.zip
  cp -p jce/*.jar /usr/java/jdk1.6.0_31/jre/lib/security/
fi

if rpm -q oracle-j2sdk1.7; then
  wget -c --no-cookies --no-check-certificate --header "Cookie: oraclelicense=accept-securebackup-cookie" \
    http://download.oracle.com/otn-pub/java/jce/7/UnlimitedJCEPolicyJDK7.zip -O jce_policy-7.zip
  unzip jce_policy-7.zip
  cp -p UnlimitedJCEPolicy/*.jar /usr/java/jdk1.7.0_67-cloudera/jre/lib/security/
fi

if rpm -q oracle-j2sdk1.8; then
  wget -c --no-cookies --no-check-certificate --header "Cookie: oraclelicense=accept-securebackup-cookie" \
    http://download.oracle.com/otn-pub/java/jce/8/jce_policy-8.zip -O jce_policy-8.zip
  unzip jce_policy-8.zip
  cp -p UnlimitedJCEPolicyJDK8/*.jar /usr/java/jdk1.8.0_*/jre/lib/security/
fi
popd
