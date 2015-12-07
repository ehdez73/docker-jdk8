FROM ubuntu:14.04 
MAINTAINER Ernesto Hernandez "ehdez73@gmail.com"

EXPOSE 9000
EXPOSE 9092
EXPOSE 8080

RUN apt-get install -y software-properties-common
RUN add-apt-repository -y ppa:webupd8team/java
RUN apt-get update

############################################################ BUILD TOOLS ######################################################### 
# GIT
#####
RUN apt-get install -y git

# JAVA
############
# Auto-accept the Oracle JDK license
RUN echo oracle-java8-installer shared/accepted-oracle-license-v1-1 select true | sudo /usr/bin/debconf-set-selections; \
    apt-get install -y oracle-java8-installer

RUN apt-get install -y wget unzip
RUN wget  --no-check-certificate --no-cookies --header "Cookie: oraclelicense=accept-securebackup-cookie" http://download.oracle.com/otn-pub/java/jce/8/jce_policy-8.zip; \
	unzip jce_policy-8.zip; \ 
	mv -f UnlimitedJCEPolicyJDK8/*.jar /usr/lib/jvm/java-8-oracle/jre/lib/security/.

