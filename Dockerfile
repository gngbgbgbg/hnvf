FROM ubuntu:22.04

ENV DEBIAN_FRONTEND=noninteractive

# نصب ابزارها
RUN apt update && apt install -y \
    openssh-server \
    sudo \
    curl \
    wget \
    nano \
    vim \
    htop \
    && mkdir /var/run/sshd

# ساخت کاربر SSH
RUN useradd -m -s /bin/bash yashar && \
    echo "yashar:CHANGE_PASSWORD" | chpasswd && \
    usermod -aG sudo yashar

# تنظیم SSH
RUN sed -i 's/#PasswordAuthentication yes/PasswordAuthentication yes/' /etc/ssh/sshd_config && \
    sed -i 's/#PermitRootLogin prohibit-password/PermitRootLogin yes/' /etc/ssh/sshd_config && \
    echo "Port 22" >> /etc/ssh/sshd_config

# پورت SSH
EXPOSE 22

# اجرای SSH
CMD ["/usr/sbin/sshd","-D"]
