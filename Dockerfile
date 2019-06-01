From python:3.7
WORKDIR /app
COPY ./ /app
RUN pip install pipenv
RUN pipenv sync
CMD ["python", "app.py"]
