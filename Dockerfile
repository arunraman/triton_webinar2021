FROM nvcr.io/nvidia/tritonserver:21.08-py3

RUN pip install jupyter -U && pip install jupyterlab 

RUN pip install Pillow attrdict protobuf grpcio tritonclient[http] nvidia-pyindex

RUN chmod 777 /usr/local/bin/perf_analyzer

EXPOSE 31000

WORKDIR /tritonworkspace

COPY *.ipynb /tritonworkspace/
COPY image_client.py /tritonworkspace/
RUN mkdir -p /tritonworkspace/models
RUN mkdir -p /tritonworkspace/images
ADD inception_graphdef /tritonworkspace/models/inception_graphdef/
COPY image_data/basketball.jpg /tritonworkspace/images
COPY image_data/football.jpg /tritonworkspace/images
COPY image_data/soccer_ball.jpg /tritonworkspace/images
COPY image_data/volleyball.jpg /tritonworkspace/images


ENTRYPOINT ["jupyter", "lab","--ip=0.0.0.0","--port=31000","--allow-root", "--no-browser", "--NotebookApp.token=''"]
