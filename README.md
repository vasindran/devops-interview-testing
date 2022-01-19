# Introduction 
This terraform used to deploy the code from github hub repository URL. And for this deployment, we procuring the Azure web apps service and pointing the GIt hub url to get the code and deploy.

# Getting Started
Regiestered and created application in accuweather portal and got approved with API Key id. And i have configured the key in the application settings:
1.	Installation process
	Prepared the terraform template file with required information on Azure subscription, resource group, and web application service to deploy the application.
2.	Software dependencies
	Used Azure devops tools to configure the automated deployment. So the terraform template will provison the required Azure resource to deploy the application in Azue web apps service.
3.	Latest releases
	Used latest version of terraform validation tools
	
# Build and Test
Azure pipeline instruction file.
	This will create the azure pipeline and associate different stage and jobs like validate and deploy the template file.
	Validation like syntax check, policy violation will be handled at this stage.
	All deployment of azure resources are handled in deploy stage.

# Contribute
If any developer push their changes to the main branch of the code repository, this will deploy the application automatically in Azure by using pipeline.