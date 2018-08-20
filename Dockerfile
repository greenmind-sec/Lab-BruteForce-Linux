FROM debian

MAINTAINER greenmind.sec@gmail.com

#FROM debian

RUN apt-get update 

RUN apt-get install -y openssh-server

RUN mkdir /var/run/sshd

RUN groupadd -r administrador && useradd --no-log-init -r -g administrador administrador

RUN echo 'administrador:senha@complexa' | chpasswd

RUN echo 'root:senha@complexa@root' | chpasswd

RUN sed -i 's/PermitRootLogin prohibit-password/PermitRootLogin yes/' /etc/ssh/sshd_config

# SSH login fix. Otherwise user is kicked off after login
RUN sed 's@session\s*required\s*pam_loginuid.so@session optional pam_loginuid.so@g' -i /etc/pam.d/sshd

ENV NOTVISIBLE "in users profile"
RUN echo "export VISIBLE=now" >> /etc/profile

EXPOSE 22
CMD ["/usr/sbin/sshd", "-D"]


# REFERENCIAS
# https://docs.docker.com/engine/examples/running_ssh_service/#run-a-test_sshd-container
# https://docs.docker.com/develop/develop-images/dockerfile_best-practices/#user

# root:$6$/e4rYtpf$4PWgO1p1GHRTlAKg40HOoIWwYPgANyz3z89CfSVU.4LO.tu8SRKPDBQpS8qKESnC82qcqYpi6BlhvAI00Eyum1:17763:0:99999:7:::
# administrador:$6$V6S8NGWz$HQaafbWPO7XKtiZfkCxCfMU.Z3elk1TZvZmrJqVlQkVcpW2sL8yLkwVzXHPPEMVMta/gqOOwtheSILZOLaPiZ1:17763::::::

# docker build -t "greenmind/bruteforcelinux:1" .
# docker run -p 8022:22 "greenmind/bruteforcelinux:1"
# ssh administrador@0.0.0.0 -p 8022
