# clean up local environment
ls -laG
find . -name "*.zip*" -exec rm -f {} \;
find . -name "*.xml*" -exec rm -f {} \;
ls -laG

# define vars
ENVIRONMENTCLIENT="resources"
VERSION="1.0.0-SNAPSHOT"
VERSIONNUM=$(echo ${VERSION} | cut -d '-' -f1)

# get client metadata
wget --user=technical --password=technical "http://nexus3:8081/nexus3/repository/maven-snapshots/workshop/jenkins/angular/session/$VERSION/maven-metadata.xml"  --content-disposition
cat maven-metadata.xml

# generate client timestamp
TIMESTAMP=$(sed ':a;N;$!ba;s/\n/ /g' maven-metadata.xml | sed 's/ //g' | grep -o "<classifier>$ENVIRONMENTCLIENT</classifier><extension>zip</extension><value>$VERSIONNUM-[[:digit:]]*\.[[:digit:]]*-[[:digit:]]*</value>" | grep -o "$VERSIONNUM-[[:digit:]]*\.[[:digit:]]*-[[:digit:]]*")

# get client artifact
wget --user=technical --password=technical "http://nexus3:8081/nexus3/repository/maven-snapshots/workshop/jenkins/angular/session/$VERSION/session-$TIMESTAMP-$ENVIRONMENTCLIENT.zip" --content-disposition
