![GitHub closed pull requests](https://img.shields.io/github/issues-pr-closed/jht3820/luna-agile)
[![GitHub issues](https://img.shields.io/github/issues/jht3820/luna-agile)](https://github.com/jht3820/luna-agile/issues)
[![GitHub forks](https://img.shields.io/github/forks/jht3820/luna-agile)](https://github.com/jht3820/luna-agile/network)
[![GitHub stars](https://img.shields.io/github/stars/jht3820/luna-agile)](https://github.com/jht3820/luna-agile/stargazers)
[![GitHub license](https://img.shields.io/github/license/jht3820/luna-agile)](https://github.com/jht3820/luna-agile/blob/master/LICENSE)
![GitHub tag (latest by date)](https://img.shields.io/github/v/tag/jht3820/luna-agile)
![GitHub release (latest by date including pre-releases)](https://img.shields.io/github/v/release/jht3820/luna-agile?include_prereleases)
![GitHub Workflow Status](https://img.shields.io/github/workflow/status/jht3820/luna-agile/CI)  



<br/>
<br/>
<br/>
<p align="center"><img src="/assets/images/opensoftlab_logo.jpg"></p> 
<br/>
<br/>
<br/>



# 1. LUNA™ AGILE Introduction

LUNA™ AGILE solves the problems of the existing waterfall water development business
It is a project management solution based on agile methodology that can maximize the project success rate.

LUNA™ AGILE is based on the e-government standard framework that is widely used in public institution information system construction, and is composed of open source and can be continuously updated.
Compatible with various open sources.


# 2. Preparing to Install LUNA™ AGILE

### 2.1 LUNA™ AGILE Installation Preparations
 
   - Server
   ```
     - JDK 1.8  or later
     - Tomcat 7.0  or later
     - Cubrid 9.3.3  or later
   ```
   - Client 
   ```
     - Google Chrome latest version
     - IE 11  or later
   ```
 - DB installation and property setting are required for LUNA™ AGILE installation and execution.
 
 - After installing the DB, you need to set the environment file.
 
 -  It operates in accordance with the eGovFramework standard.
 
### 2.2 Keen Tneme download
 
LUNA™ AGILE uses the Keen Theme, a Bootstrap Theme.

Keen Theme must be purchased and used separately.
 
* Keen Theme purchase link: [Keen Theme](https://themes.getbootstrap.com/product/keen-the-ultimate-bootstrap-admin-theme/)
 
After purchasing Keen Theme, set the script and css files to the following path.
 
* scripr: /luna-agile/src/main/webapp/js
* css: /luna-agile/src/main/webapp/css
 


# 3. LUNA™ AGILE installation
 
### 3.1 Install LUNA™ AGILE DB on Cubrid
 
 -Install the installation scripts in the DB_install_script directory in order from No. 1.
 -Before creating the Cubrid function, compile the java file in the Cubrid Java Stored function folder and load it into Cubrid.
   After this, create a function.
   
### 3.2 LUNA™ AGILE DB access address and configuration
  ```
      /luna-agile/src/main/resources/egovframework/egovProps/globals.properties Change the settings as follows.
      
      Globals.lunaops.cubrid.driver= Your cubrid DB Driver
      Globals.lunaops.cubrid.url= Your cubrid DB URL
      Globals.lunaops.cubrid.username= Your DB username
      Globals.lunaops.cubrid.password= Your DB password
   ```
   
### 3.3 LUNA™ AGILE created the first system administrator
 ```
   /luna-agile/src/main/resources/egovframework/egovProps/globals.properties Change the settings as follows.
      
   Globals.oslits.userJoin= N → Change the item Y to set the first system administrator to sign up for membership.
      
   The ID created through membership registration is automatically created with the authority of the system administrator of the organization.
   After creating the system administrator ID through membership registration, change the setting back to'N' to remove the membership registration function.
   After that, the system administrator registers users who will use the system through the system's user management function and registers IDs.
   Issue to use the system.
 ```
   
# 4. How to use luna-agile

### 4.1 Initial account creation and system setup

-Create your first account. Accounts created through membership registration have system administrator privileges.
   
-When you log in for the first time after creating an account, a project group and project are created.

-After logging in, register the REST API, SVN, and JENKINS information required for the system.


### 4.2 How to use each authority

-The basic authority provided by the system is the business manager, the business manager, and the general user. 

 
# 5. Contributing

Join the project, ask questions about the project, discuss the  [Google Group](https://groups.google.com/forum/#!forum/opensoftlab-github-group)

  -Go to the group site and log in with your Google account and apply for membership.
  -After approval of membership, you can join the group.


# 6. License Information

- LUNA™ AGILE uses the GPL3.0 license. ([GPL3.0 License Information](https://www.olis.or.kr/license/Detailselect.do?lId=1072))
