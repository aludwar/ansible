# Configuration as Code Official Instruction Guide

> [!IMPORTANT]
> You will need an Ansible Automation Platform (AAP) 2.6+ environment already deployed to run this automation code against. This code does not deploy the AAP environment for you, rather it configures it once it's been installed. You may [read the docs](https://docs.redhat.com/en/documentation/red_hat_ansible_automation_platform/2.6/html-single/containerized_installation/index) on how to install AAP 2.6+.

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


That should be enough to get a basic Configuration as Code structure setup, where you are connecting to a freshly deployed AAP 2.6+ environment in order to configure it.
 

### Vetted Example #1 - Basic "Get It Working"

For some additional perspective, here are my created files based on the above steps as I worked through them. Please feel free to shamelessly copy and modify them to your liking. The minimum amount of files for getting Configuration as Code running (in these examples):


```
$ pwd
/home/aludwar/aap_casc/
$ tree *
ansible.cfg
configs
├── auth.yml
├── organizations.yml
├── projects.yml
deploy_aap.yml
env.yml
requirements.yml
```

* `ansible.cfg` - Configuration file for defining items, specifically Galaxy & Automation Hub in order to download the correct collections
* `requirements.yml` - A list of the collections to download
* `env.yml` - File for environment variables to export (Ansible Galaxy / Automation Hub token) (Encrypt this with Ansible Vault if you plan to commit to a public repository/source control)
* `configs/auth.yml` - File for passwords, credentials, etc.  (Encyrpt this with Ansible Vault if you plan to commit to a public repository/source control)
* `configs/organizations.yml` - Define your AAP organization
* `configs/projects.yml` - Setup github/gitlab repos as projects 
* `deploy_aap.yml` - playbook to apply the configs directory to an AAP environment


*First*, you will need to change the _remote_user_ and _collections_path_ variables in the provided ansible.cfg file (marked with CHANGEME). This will make sure your ansible collections are stored in your local home directory, and findable by ansible-galaxy, ansible-playbook, etc.

`$ vi ansible.cfg`

*Second*, you will need to retrieve your own Automation Hub token, include it in env.yml, and export that environment variable. Combined with the settings provided in ansible.cfg, this will allow you to login to Red Hat Automation Hub and download the appropriate collections. You will need to do this prior to installing the collections in the requirements.yml file:

1. Get [Automation Hub Token](https://docs.redhat.com/en/documentation/red_hat_ansible_automation_platform/2.4/html/getting_started_with_automation_hub/hub-create-api-token#proc-create-api-token)
2. Modify env.yml file with Automation Hub Token retrieved in previous step.
3. Export the environment variable in your shell:

   `$ export ANSIBLE_GALAXY_SERVER_AUTOMATION_HUB_TOKEN=<your token here>`

4. Install the provided collections in requirements.yml:

   `$ ansible-galaxy collection install -r requirements.yml`



*Third*, change the configs/auth.yml file to reflect your credentials for your environment. I've left some from my environment intact as an example, and changed some other more sensitive ones to CHANGEME, which *you need to change prior to running deploy_aap.yml*.

I've included a few more files than the bare minimum as examples, but you can safely delete all of these and only keep ones the mentioned above to get Configuration as Code working. If you want to try a few different configuration items as I have (I feel these are the most common items folks want to configure in the platform) you may use all of my files as an example.



### Vetted Example #2 - Basic "Get It Working" + Basic 2 "Add More Examples Of Each Type"

```
$ pwd
/home/aludwar/aap_casc/
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
```

* configs/credentials.yml - Example to show creating Access Tokens and SSH key
* configs/hub_remotes.yml - Example to show creating Automation Hub repos to download collections
* configs/inventories.yml - Example to show creating inventory from a sourcefile located in git repo (inventory file example provided here)
* configs/jobtemplates.yml - Example to show creating both Job Templates, and Workflow Templates using tthose same jobs
* configs/settings.yml - Example to show changing a setting in AAP to enable Automation Analytics
