 
Nifi CDP  
 
********************************************** 
  Nifi - Cloudera 
********************************************** 
 
---** Download and install nifi **--- 
 
>> Do this on all hosts  
 
$ wget https://archive.apache.org/dist/nifi/1.9.0/nifi-1.9.0-bin.tar.gz 
$ tar -xzvf nifi-1.9.0-bin.tar.gz  
$ cd /opt 
$ sudo mkdir nifi 
$ sudo mv nifi-1.9.0 /opt/nifi 
 
---** Configure Nifi **--- 
 
$ cd /opt/nifi/nifi-1.9.0 
$ cd conf 
$ sudo nano nifi.properties 
 
nifi.web.http.host=ip-172-31-92-235.ec2.internal 
nifi.web.http.port=8080 
 
nifi.cluster.is.node=true 
nifi.cluster.node.address=ip-172-31-92-235.ec2.internal  
nifi.cluster.node.protocol.port=11122 
 
nifi.zookeeper.connect.string=ip-172-31-89-107.ec2.internal:2181,ip-172-31-86-
50.ec2.internal:2181,ip-172-31-87-27.ec2.internal:2181 
 
nifi.state.management.provider.cluster=zk-provider 
 

nifi.sensitive.props.key=password 
 
$ sudo nano state-management.xml 
 
 <property name="Connect String">nifi.zookeeper.connect.string=ip-172-31-89-
107.ec2.internal:2181,ip-172-31-86-50.ec2.internal:2181,ip-172-31-87-
27.ec2.internal:2181</property> 
 
$ cd .. 
$ cd bin 
$ sudo nano nifi-env.sh 
export JAVA_HOME=/usr/lib/jvm/java-8-openjdk 
 
$ cd .. 
 
---** Start Nifi **--- 
 
$ ./bin/nifi.sh start 
$ cd logs/ 
$ nano nifi-app.log 
 
Connect to Nifi webui on 8080 
 
 
################################################################################ 
 
---** Create flow file for hdfs & S3 **--- 
 
>> Connect to worker node 
 
$ hdfs dfs -mkdir -p /user/ubuntu/nifidata 
$ hdfs dfs -chown -R ubuntu:ubuntu /user/ubuntu 
$ hdfs dfs -ls -R /user/ubuntu 
 
>> Create bucket on S3 
 
>> Create an IAM user with s3 full access and create credentials 
 
>>> On Nifi UI :8080
 
