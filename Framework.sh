echo "What you want to do\t (Note: Enter only number)\n1.Create K8S Cluster \t2.Deploy Application to a K8s \t3.Apply policies."
read number
if [ $number -lt 1 ]
then
        echo "Usage : Enter only number >= 1"
        exit
fi 

if [ $number -eq 1 ]
then 
	echo "You have chosen to create K8s cluster\nChoose your provider\n1.AWS\t2.Azure \t3.GCP \t4.On Premise"
	read region
	if [ $region -lt 1 ]
	then
		echo "Usage : Enter only number >= 1"
        	exit
	fi 
	
	#For AWS	
	if [ $region -eq 1 ]
	then
		echo "You are creating cluster on AWS....Exiting for now"
	fi
	
	if [ $region -eq 2 ]
        then
                echo "You are creating cluster on AZURE....Exiting for now"
        fi

	if [ $region -eq 3 ]
        then
                echo "You are creating cluster on GCP....Exiting for now"
        fi

	if [ $region -eq 4 ]
        then
                echo "You are creating cluster on On Premise."
		chkCluster=`minikube kubectl get nodes | awk '{print $1}'`
		if [ -n chkCluster ]
		then
			echo "Cluster is already there with following nodes $chkCluster.\nDo want want to deploy an application to cluster?\t1. Yes \t2. No"
			read DepApp
			if [ $DepApp -eq 1 ]
			then
				echo "Please provide your git url containing application to deploy"
				mkdir DeployApp
				read gitUrl
				echo "gitUrl=$gitUrl" >> DeployApp/jenkins_variable
#				java -jar jenkins-cli.jar -s Jenkins_URL -webSocket build JOB_NAME
				exit
			else
				echo "You have opted not to deploy application..exiting"
				exit
			fi
		fi
		read DepApp
		
        fi


fi


