# vocabulary
Try using Amazon DynamoDB and AWS AppSync within a JavaScript framework through the GraphQL API.

# environment
- Node.js v18.3.0
- nvm v18.3.0

When you need to use nvm in local environment for development,
you can install the Node.js version by running the following command:
```bash
nvm install v18.3.0
```
And you can switch the Node.js version by running the following command:
```bash
nvm use v18.3.0
```
After, you can move to ./vocabulary directory where the package.json is located,
and run the development server by running the following command:
```bash
cd ./vocabulary
npm run dev
```

# aws cognito
You need to create a user pool in AWS Cognito and configure the following environment variables in the `.env.example` file.

# terraform
You can create or manage the AWS resources by running the following command:
```bash
terraform init
terraform apply
```
Or you can destroy the AWS resources by running the following command:
```bash
terraform destroy
```
Also, you can refer to the `main.tf.example` file to adjust your own AWS resources.