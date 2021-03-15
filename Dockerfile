ARG VER=7
ARG SIZE=
FROM registry.access.redhat.com/ubi$VER/ubi$SIZE 
# simple command print unix name info
CMD [ "uname", "-a" ]

