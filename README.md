# ansible-ci - Run ansible in docker-based CI systems

Following the *infrastructure as code* concept it is
useful to handle `ansible-playbook` calls by CI.

This repo provides an image alongside with some references
how to use `ansible` with CI pipelines.

## Usage with `gitlab-ci`

**Example:**

```
---

image: "pytea/ansible-ci:2.7"

stages:
  - check
  - run

check:
  stage: check
  script:
    - yamllint .

deploy:
  stage: run
  script:
    - ansible-playbook -i inventory.yml site.yml
```