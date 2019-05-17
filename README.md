# Automated Testing for REST APIs
An automated testing suite for a Flo's REST APIs.

# Requirements
+ [NodeJS](https://nodejs.org/en/)
+ [NPM](https://www.npmjs.com/get-npm)
+ [Postman](https://www.getpostman.com/)

# Installation

### Newman
```
npm install -g newman
```

### Express
```
npm install express
```

### FS
```
npm install fs
```

### Body Parser
```
npm install body-parser
```
### CSV Writer
```
npm install csv-writer
```


# Run
### Start a local server
```
node app.js
```


### Run Postman collection in Newman for SignUp
```
./tests/SignUp.sh 'api_user_signup' 'env' 'file'
```


### Run Postman collection in Newman
```
./tests/tests.sh 'api_version_no' 'env'

```

# Report
Test result will automatically report to the team via any channels: email, slack, etc,...
# License
### © [Floware Vietnam](https://floware.com)