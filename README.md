# paloalto-azureterraform
This repo is a POC for updating palo alto configuration with terraform. 
Terragrunt configuration and terraform are used.
Version: 
panos        = 1.6.3
terraform    = v0.12.29
terragrunt   = v0.23.33

Yet to do
  1. Policies yet to be tested in this repo.
  2. DNS proxy feature is not available in Panos terraform module. 
  3. Need to find out what other features are not available, work in progress.

API Basics: 
  API Type Description
	•   keygen- Generate an API Key (not shown in API Browser)
	•   config- Retrieve or modify the configuration
	•   commit- Commit the configuration
	•   export- Export files, packet captures, and keys
	•   import- Import files, certificates, response pages, and branding
	•   op- Operational commands (like ‘show’ commands)
	•   report- Retrieve predefined, dynamic, and custom reports
      user-id- User/IP mappings and Dynamic Address Groups


Portion of the candidate configuration
Format: https://<firewall>/api/key=apikey&type=config&action=get&xpath=<path-to-config-node>

Firewall candidate configuration
https://<firewall>/api/?type=config&action=get&xpath=/config/devices/entry/vsys/entry[@name='vsys1']&key=<api_key>

Address objects in a virtual system (vsys).
https://<firewall>//api/?key=apikey&type=config&action=get&xpath=/config/devices/entry/vsys/entry[@name='vsys1']/address
								
Full list of applications
https://<firewall>/api/?key=apikey&type=config&action=get&xpath=/config/predefined/application
								

