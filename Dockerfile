FROM nvidia/cuda:12.6.3-base-ubuntu24.04
RUN apt update && apt install -y python3 python3-venv
RUN ln -s /usr/bin/python3 /usr/local/bin/python
COPY . /src
WORKDIR /src
RUN python -m venv venv
ENV PATH=/src/venv/bin:$PATH
RUN pip install torch torchvision torchaudio --index-url https://download.pytorch.org/whl/cu126
RUN pip install -r requirements.txt && pip install -e .
