FROM centos:centos7
 
RUN yum -y update \
 && yum install -y openssh-server \
    openssh-clients \
 && yum clean all
 
# パスワードを使用したログインを許可しない
# ポートを22から20022に変更
# rootのパスワードをpasswordに設定
RUN sed -ri 's/^#PasswordAuthentication yes/PasswordAuthentication no/' /etc/ssh/sshd_config \
 && sed -ri 's/^#Port 22/Port 20022/' /etc/ssh/sshd_config \
 && echo 'root:password' | chpasswd
  
EXPOSE 20022
