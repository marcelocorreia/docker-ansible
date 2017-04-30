# marcelocorreia/ansible

Docker image with [Ansible](http://docs.ansible.com) + [AWS CLI](https://aws.amazon.com/cli/)

## INFO
- Workdir is set to /opt/workspace
- Github: [https://github.com/marcelocorreia/docker-ansible](https://github.com/marcelocorreia/docker-ansible)
- [Integration](#) with [Concourse CI](http://concourse.ci/) 
 
## Usage
```bash
$> docker run --rm -v $(shell pwd):/opt/workspace \
   		marcelocorreia/ansible \
   		ansible --version] 
```
## Packages Installed


### Workdir
Workdir set to /op/workspace

### Timezone

Timezone set to UTC.
Set TZ Environment variable to change it as needed.

#### Example

```bash
>$ docker run --rm -v $(shell pwd):/opt/workspace \
      		marcelocorreia/ansible \
      		-v $(shell pwd):/opt/workspace
      		-e TZ=Australia/Sydney \
      		ansible-playbook -i /inventory a.play.book.yml 
```

## Example
```bash
$> docker run --rm -v $(shell pwd):/opt/workspace \
   		marcelocorreia/ansible \
   		ansible --version    		
```
