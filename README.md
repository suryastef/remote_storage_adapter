# Dockerfile build for remote_storage_adapter
A Prometheus storage drive to store data into external TSDB, this will replace built in TSDB from Prometheus.
This image is based on **alpine** as builder to compile go from source code and using image **scratch** as main image to reduce image size.
