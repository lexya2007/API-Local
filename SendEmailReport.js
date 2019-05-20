var fs = require('fs');
var nodemailer = require('nodemailer');
var parse = require('csv').parse
var results = [];
var fileReportUri = "../tests/output/reports_failed.csv";
console.log('URI File csv report: '+fileReportUri);


var transporter = nodemailer.createTransport({
  service: 'gmail',
  auth: {
    user: 'automationqcflo@gmail.com',
    pass: 'Aa@12345'
  }
});

var from = 'automationqcflo@gmail.com';
var to = 'nguyen.nguyen@flomail.net';
var cc = ''
var subject = '[Automation Report] - Run All Scripts APIs';

var mailOptions = {
    from: from,
    to: to,
    cc: cc,
    subject: subject,
    content: '123',
    text: 'Hi all,\nThis is automation report of all scripts APIs.\n\n    - No test case failed!'
    +'\n\n\nThanks\n'
    +'Automation Team.',
    attachments:[],
 }
var msg;
if (fs.existsSync(fileReportUri)){
  fs.createReadStream(fileReportUri)
  .pipe(csv())
    .on('data', (data) => results.push(data.Summary))
  .on('end', () => {
    msg = mailOptions;
      var count = results.length;
      console.log("Testcase Failed: "+count);
      var string = results.toString();
      var anotherString = string.replace(/\,\[/g,'\n - [');
      console.log("Testcase: "+anotherString);
      // Split to get Version
      if(string.includes("api/v2")){
        var partSplit = string.split("[api/")[1];
        var partSplit1 = partSplit.split("]")[0];
        var version = partSplit1;
      }else{
        var partSplit = string.split("/api]");
        var version = partSplit[0];
        var version = version.replace('[v',"");
      }
      msg.subject = '[Automation Report] - Run All Scripts APIs On Version '+version;
      msg.text = 'Hi all,\nThis is automation report of all scripts APIs.\n'
      +'Failed '+count+' test cases:\n'
      +'\n - '+anotherString
      +'\n\n\nThanks\n'
      +'Automation Team.\n\n';
      msg.attachments[0] = {
        filename: 'reports_failed.csv',
        path: fileReportUri,
      }
      // Send email
      transporter.sendMail(mailOptions, function(error, info){
      if (error) {
        console.log("Send email not successful!");
      } else {
        console.log('Send email successful!');
      }
    });
  }); 
}else{
  transporter.sendMail(mailOptions, function(error, info){
      if (error) {
        console.log("Send email not successful!");
      } else {
        console.log('Send email successful!');
      }
    });
}
