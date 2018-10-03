FROM ubuntu:bionic

MAINTAINER Ivan Kropotov <ivan.cropotov@toptal.com>

# Install Python runtime
RUN apt-get update && \
    apt-get install -qy \
    -o APT::Install-Recommend=false -o APT::Install-Suggests=false \
    python python-virtualenv libpython2.7 python-mysqldb gcc

# Create virtual environment
# Upgrade PIP in virtual environment to latest version
RUN virtualenv /appenv && \
	. /appenv/bin/activate && \
	pip install pip --upgrade

# Add entrypoint script
ADD scripts/entrypoint.sh /usr/local/bin/entrypoint.sh
RUN chmod +x /usr/local/bin/entrypoint.sh
ENTRYPOINT ["entrypoint.sh"]
