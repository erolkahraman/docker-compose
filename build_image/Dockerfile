FROM ubuntu:20.04
RUN apt update && apt install tcpdump -y
ADD a.sh /usr/bin/
RUN chmod +x /usr/bin/a.sh
CMD ["sh","a.sh"]
