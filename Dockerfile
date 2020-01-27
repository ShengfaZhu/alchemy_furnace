FROM ubuntu:16.04

COPY build_esentials.sh /tmp/build_esential.sh
COPY requirements.txt /tmp/requirements.txt

RUN chmod +777 /tmp/build_esential.sh && \
    ./tmp/build_esential.sh 

# user id
ARG userid=501
ARG groupid=501
ARG username=shengfazhu
RUN useradd -l -m -d /home/${username} ${username} \
    && echo "${username}:${username}" | chpasswd \
    && usermod --shell /bin/bash ${username} \
    && usermod -aG sudo ${username} \
    && mkdir -p /etc/sudoers.d \
    && echo "${username} ALL=(ALL) NOPASSWD:ALL" >> /etc/sudoers.d/${username} \
    && chmod 0440 /etc/sudoers.d/${username} \
    # Replace user/group id
    && usermod --uid ${userid} ${username} \
    && groupmod -o --gid ${groupid} ${username} \
    && echo "furnace" >> /etc/hostname

# clean up cache
RUN apt-get -y autoremove && \
    apt-get -y clean && \
    rm -rf /root/.cache/* && \
    rm -rf /tmp/*

USER ${username}
WORKDIR /home/${username}

COPY .ssh/ /home/${username}/.ssh/ 

