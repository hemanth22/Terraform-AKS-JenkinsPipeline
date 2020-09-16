node {
    stage('Preparation') { // for display purposes
        // Get some code from a GitHub repository
        git credentialsId: 'github', url: 'https://github.com/hemanth22/AKS-Terraform.git'
        // Get the Maven tool.
        // ** NOTE: This 'M3' Maven tool must be configured
        // **       in the global configuration.
    }
    stage('Download the plugin') {
        sh 'terraform init'
    }
    stage('Plan environment') {
    withCredentials([string(credentialsId: 'ARM_CLIENT_ID', variable: 'ARM_CLIENT_ID'), string(credentialsId: 'ARM_CLIENT_SECRET', variable: 'ARM_CLIENT_SECRET'), string(credentialsId: 'ARM_SUBSCRIPTION_ID', variable: 'ARM_SUBSCRIPTION_ID'), string(credentialsId: 'ARM_TENANT_ID', variable: 'ARM_TENANT_ID'), string(credentialsId: 'ARM_CLIENT_ID', variable: 'TF_VAR_ARM_CLIENT_ID'), string(credentialsId: 'ARM_CLIENT_SECRET', variable: 'TF_VAR_ARM_CLIENT_SECRET')]) {
        sh 'terraform plan -out=aksdesgin'
      }
    }
    stage('Create AKS environment') {
    withCredentials([string(credentialsId: 'ARM_CLIENT_ID', variable: 'ARM_CLIENT_ID'), string(credentialsId: 'ARM_CLIENT_SECRET', variable: 'ARM_CLIENT_SECRET'), string(credentialsId: 'ARM_SUBSCRIPTION_ID', variable: 'ARM_SUBSCRIPTION_ID'), string(credentialsId: 'ARM_TENANT_ID', variable: 'ARM_TENANT_ID'), string(credentialsId: 'ARM_CLIENT_ID', variable: 'TF_VAR_ARM_CLIENT_ID'), string(credentialsId: 'ARM_CLIENT_SECRET', variable: 'TF_VAR_ARM_CLIENT_SECRET')]) {
        sh 'terraform apply aksdesgin'
      }
    }
    stage('fectch config file') {
    withCredentials([string(credentialsId: 'ARM_CLIENT_ID', variable: 'ARM_CLIENT_ID'), string(credentialsId: 'ARM_CLIENT_SECRET', variable: 'ARM_CLIENT_SECRET'), string(credentialsId: 'ARM_SUBSCRIPTION_ID', variable: 'ARM_SUBSCRIPTION_ID'), string(credentialsId: 'ARM_TENANT_ID', variable: 'ARM_TENANT_ID'), string(credentialsId: 'ARM_CLIENT_ID', variable: 'TF_VAR_ARM_CLIENT_ID'), string(credentialsId: 'ARM_CLIENT_SECRET', variable: 'TF_VAR_ARM_CLIENT_SECRET')]) {
        sh 'echo "$(terraform output kube_config)" > ~/.kube/azurek8s'
      }
    }
    stage('Get nodes details') {
        sh """
              export KUBECONFIG=~/.kube/azurek8s'
              kubectl get nodes
        """
    }
    stage('Deployment') {
        sh """
              export KUBECONFIG=~/.kube/azurek8s'
              kubectl create -f deployment.yml
        """
    }
    stage('Deployment') {
        sh """
              export KUBECONFIG=~/.kube/azurek8s'
              kubectl create -f service.yml
        """
}
