FROM ubuntu:20.04
RUN apt update && apt install tcpdump -y
ADD --chmod=0755 a.sh /usr/bin/
CMD ["sh","a.sh"]
