# AleoSmartContractDocker

## Requirements

- CPU: 2 cores
- RAM: 2 GiB
- Storage: 100 GiB
- Docker installed
## How to run

You can use the pre-created image that we have already prepared. [Link to the image](https://hub.docker.com/repository/docker/nodeslls/aleo_nodeslls/general)

### STEP 1 - Clone the repository
Clone the repository to your computer by executing the following command:
```
git clone https://github.com/NodesLLS/AleoSmartContractDocker
```

### STEP 2 - Run the Docker container

```
docker run -d --name aleo-smartcontract nodeslls/aleo_nodeslls
```
After running this command, the Docker container will start with all the dependencies installed for the Aleo smart contract.

### STEP 3 - Launch the smart contract

To access the container, execute the following command:

```
docker exec -it aleo-smartcontract bash
```

Then navigate to the home folder and run the script:

```
cd
bash deploy_app.sh
```

You will be prompted to enter all the necessary data to launch the smart contract.

That's it! You have successfully launched the smart contract.

## Build your own image

If you want to build your own image, follow these steps:

1. In the Dockerfile folder, run the following command:
```
docker build . -t <Your DockerHub username>/<Your image name>:<Tag>
```

2. Once the image is built, you can use the previous instructions to deploy a smart contract.