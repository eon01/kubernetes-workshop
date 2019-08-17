FROM python:3
ENV PYTHONUNBUFFERED 1
RUN adduser pyuser

RUN mkdir /app
WORKDIR /app
COPY requirements.txt /app
RUN pip install --upgrade pip
RUN pip install -r requirements.txt
COPY . .
RUN chmod +x app.py

RUN chown -R pyuser:pyuser /app
USER pyuser


EXPOSE 5000
CMD ["gunicorn", "app:app", "--config=config.py"]
