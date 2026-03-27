### Configuration as Code Official Instruction Guide

1. Follow these instructions linked in the Red Hat CoP - Getting Started docs section (link below): 

Specifically, do these steps:

Step 1: Create a Requirements File
Step 2: Install the Collections
...
Step 1. Create Your Project Structure
Step 2. Create Authentication Variables
Step 3. Create Your First Configuration
Step 4. Create your Playbook
Step 5. Run Your Configuration

[Red Hat CoP - infra.aap_configuration - Getting Started](https://github.com/redhat-cop/infra.aap_configuration/blob/devel/docs/GETTING_STARTED.md)


That should be enough to get a basic Configuration as Code structure setup, where you are connecting to a freshly deployed AAP 2.6+ environment in order to configure it. The prerequisite is that you already have a deployed AAP 2.6 environment to work with. (Can be blank or already setup)
 

### Vetted Example #1 - Basic "Get It Working"

For some additional perspective from a working example, here are my created files based on the above steps and included examples there as I worked through the same steps:

The minimum amount of files for getting Configuration as Code running (in these examples):

`
$ tree *
ansible.cfg
configs
├── auth.yml
├── organizations.yml
├── projects.yml
deploy_aap.yml
env.yml
requirements.yml
`

* ansible.cfg - Configuration file for defining items, specifically Galaxy & Automation Hub in order to download the correct collections
* requirements.yml - A list of the collections to download
* env.yml - vault file for environment variables (Ansible Galaxy / Automation Hub token)
* configs/auth.yml - vault file for passwords, credentials, etc.
* configs/organizations.yml - Define your AAP organization
* configs/projects.yml - Setup github/gitlab repos as projects 
* deploy_aap.yml - playbook to apply the configs directory to an AAP environment


You will need to populate your own env.yml token, as well as change the configs/auth.yml file to reflect your credentials for your environment. I've left some from my environment intact as an example, and changed some other more sensitive ones to CHANGEME, which you should change prior to running deploy_aap.yml.

I've included a few more files than the bare minimum as examples, but you can safely delete all of these and only keep the mentioned above to get Configuration as Code working. If you want to try a few different configuration items as I have (I feel these are the most common items folks want to configure in the platform) you may use all of my files as an example.



### Vetted Example #2 - Basic "Get It Working" + Basic 2 "Add More Examples Of Each Type"

`
$ tree
ansible.cfg
configs
├── auth.yml
├── credentials.yml
├── hub_remotes.yml
├── inventories.yml
├── jobtemplates.yml
├── organizations.yml
├── projects.yml
└── settings.yml
deploy_aap.yml
env.yml
inventory
requirements.yml
`

* configs/credentials.yml - Example to show creating Access Tokens and SSH key
* configs/hub_remotes.yml - Example to show creating Automation Hub repos to download collections
* configs/inventories.yml - Example to show creating inventory from a sourcefile located in git repo (inventory file example provided here)
* configs/jobtemplates.yml - Example to show creating both Job Templates, and Workflow Templates using tthose same jobs
* configs/settings.yml - Example to show changing a setting in AAP to enable Automation Analytics
