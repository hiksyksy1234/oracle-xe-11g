#!/bin/bash

ORA_RPM="oracle-xe-11.2.0-1.0.x86_64.rpm"

#
# download the Oracle installer
#
downloadOracle () {

        local url="https://github.com/hiksyksy1234/oracle-xe-11g"

        echo "[Downloading '$ORA_RPM']"
        curl -s --retry 3 -m 60 -o /$ORA_RPM -L $url/blob/main/$ORA_RPM?raw=true

}

downloadOracle

rpm -ivh /$ORA_RPM
rm -f /$ORA_RPM

mv /init.ora       /u01/app/oracle/product/11.2.0/xe/config/scripts
mv /initXETemp.ora /u01/app/oracle/product/11.2.0/xe/config/scripts
