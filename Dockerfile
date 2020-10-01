FROM python:3-alpine

RUN apk add --no-cache gcc linux-headers musl-dev python3 python3-dev postgresql-dev \
        && pip3 install --upgrade pip

RUN pip3 install --no-cache-dir psycopg2

ADD app/ /ie/app/
ADD app.py /ie/app.py
ADD config.py /ie/config.py
ADD requirements.txt /ie/requirements.txt

WORKDIR /ie

RUN pip3 install -r requirements.txt

EXPOSE 5000

ENTRYPOINT ["python", "app.py"]
