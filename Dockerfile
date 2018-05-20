# "Parent" image. Probably more "import" than "extend"
FROM python:2.7-slim

# Set cwd and map current (host) dir to it in the container
WORKDIR /sample-app
ADD . /sample-app

EXPOSE 80

RUN pip install --trusted-host pypi.python.org -r requirements.txt
CMD ["python", "app.py"]
