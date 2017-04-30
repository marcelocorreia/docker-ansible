# marcelocorreia/ansible

Docker image with [Ansible](http://docs.ansible.com) + [AWS CLI](https://aws.amazon.com/cli/)

## INFO
- Workdir is set to /opt/workspace
- Github: [https://github.com/marcelocorreia/docker-ansible](https://github.com/marcelocorreia/docker-ansible)
- [Integration](#) with [Concourse CI](http://concourse.ci/) 
 
## Usage
```bash
$> docker run --rm -v $(shell pwd):/opt/workspace \
   		marcelocorreia/terraform \
   		terraform [--version] [--help] <command> [args]
```
## Packages Installed


## Example
```bash
$> docker run --rm -v $(shell pwd):/opt/workspace \
   		marcelocorreia/terraform \
   		terraform $1 -var-file variables.tfvars \
   		-var aws_access_key=${aws_access_key_id} \
   		-var aws_secret_key=${aws_secret_access_key}
```
