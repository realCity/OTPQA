FROM python:2
ADD * /otpqa/

WORKDIR /otpqa

RUN apt-get update && apt-get install -y --no-install-recommends \
       build-essential \
	   libprotobuf-dev \
	   libtokyocabinet-dev \
	   protobuf-compiler \
	   python-dev \
	&& rm -rf /var/lib/apt/lists/* \
    && pip install -r requirements.txt \
	&& ln -s /otpqa/*.py /usr/local/bin/

VOLUME /data
WORKDIR /data

ENTRYPOINT ["/bin/sh", "-c"]
