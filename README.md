# Ansible Code - Various Use Cases and PoC Material

## Folders: aws, azure, rhv

Contains example playbooks that make use of AWS/Azure provisioning, or Red Hat Virtualization provisioning exclusively.

## Folders: aap

Contains example playbooks that perform common maintenance tasks related to Ansible Automation Platform 2.x and Private Automation Hub (PAH).

## Folders: satellite

Contains example playbooks and variables to perform automated content management of Satellite with the Satellite Ansible Collection.

One can use this to automate:

* The syncing of content to Satellite
* The creation of new Content View versions based on that new content
* Promotion of those Content Views through an Environment Lifecycle
* Combining all of the above into a Workflow Template that sets it, and forgets it

Inspired by the wealth of knowledge of [Paul Armstrong](https://github.com/parmstro/AutomatingContentManagement), and his 3 part blog on the topic. Paul goes much deeper than the above examples, I tried to offer an automation interpretation mere mortals. Paul's blog series:

* Part 1: [Automating Content Management in Red Hat Satellite 6.9 with Red Hat Ansible Automation Platform](https://www.redhat.com/en/blog/automating-content-management-red-hat-satellite-69-red-hat-ansible-automation-platform-planning-workflow)
* Part 2: [Automating Content Management in Red Hat Satellite 6.9 with Red Hat Ansible Automation Platform](https://www.redhat.com/en/blog/automating-content-management-satellite-69-ansible-automation-platform-part-2)
* Part 3: [Automating Content Management in Red Hat Satellite 6.9 with Red Hat Ansible Automation Platform](https://www.redhat.com/en/blog/automating-content-management-satellite-69-ansible-automation-platform-part-3)

## Folders: windows

Contains example playbooks to be used to do basic connection & service setup on Windows, then automation of Windows pieces.

## Folders: roles

Self explanitory. Forked from some private repos, has had private details removed.

## Various .ymls

Various playbooks and inventory files for demos.
