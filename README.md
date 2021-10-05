Deploy a Virtual machine on VMWare ESXI and apply the CIS hardening on it.

Requirements:

    1. VMWare fusion installed on Mac
http://www.vmware.com/go/try-fusion-en

    2. VMWare ESXI iso (Will share the ISO file as an attachment)
https://my.vmware.com/en/group/vmware/evalcenter?p=vsphere-eval-7

    3. Ubuntu server iso 
https://linux.softpedia.com/dyn-postdownload.php/3a462790e8ccbeb361719bad400c4cde/5f3e03f1/19400/0/1

    4. Centos open virtualization format (OVF) file 
https://download.linuxvmimages.com/VMware/C/7/CentOS_7.8.2003_VMM.zip

Steps:

Set up ESXI host:

    1. Install VMWare fusion 

    2. Run a VMWare ESXI virtual machine on VMWare fusion
https://www.nakivo.com/blog/building-vmware-home-lab-complete/

    3. Enable SSH access on your ESXi hypervisor.

    4. Create a data store and 2 network adaptors for on ESXI host

Set up centralized ubuntu server

    5. Create another ubuntu server running virtual machine VMWare fusion

    6. Config ubuntu as master centralized server – switch to root and run the following shell script

    i) Give all permission to the script file on Mac
#chmod 777 master-config.sh 

    ii) Copy the executable file to ubuntu server
#scp master-config.sh root@ubuntu-server-ip:/tmp 

    iii) Give executable permission to it on ubuntu serverm
#chmod +x master-config.sh

    iv) Execute the file
#./master-config.sh
 	
    7. Install OVF tool 
https://code.vmware.com/web/tool/4.4.0/ovf

#chmod 755 VMware-ovftool-4.2.0-5965791-lin.x86_64.bundle
#./VMware-ovftool-4.2.0-5965791-lin.x86_64.bundle --eulas-agreed --required –console


    8. Deploy a VM using Terraform on the VMWare ESXI using centos OVF file
    i) Copy terraform-files.zip to ubuntu server
#scp terraform-files.zip user@ubuntu-server-ip:/home/$user

    ii) unzip the file
#unzip terraform-files.zip 

    iii) Copy all the files to terraform path
#cp -avr /home/$user/terraform-files $GOPATH/src/github.com/josenk/terraform-provider-esxi/

#terraform init
#terraform plan
#terraform apply
