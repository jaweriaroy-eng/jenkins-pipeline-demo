FROM ubuntu:24.04
RUN echo "Hello from Docker image built by Jenkins"
CMD ["echo", "Container running"]
