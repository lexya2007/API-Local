var fs = require('fs');
var nodemailer = require('nodemailer');
var csv = require('csv-parser');
var results = [];
var resultAPIs = [];
var fileReportUri = "../tests/output/reports_failed.csv";
var fileAPIUri = "../tests/output/reports_API.csv";
console.log('URI File csv report: '+fileReportUri);


var transporter = nodemailer.createTransport({
  service: 'gmail',
  auth: {
    user: 'automationqcflo@gmail.com',
    pass: 'Aa@12345'
  }
});

var from = 'automationqcflo@gmail.com';
var to = 'qaautomation@flomail.net';
var cc = 'automationqcflo@gmail.com,thuyvo@flomail.net'

var mailOptions = {
  from: from,
  to: to,
  cc: cc,
  subject: '',
  text: '',
  attachments:[],
}
var msg;
var APIs;
fs.createReadStream(fileAPIUri)
    .pipe(csv())
    .on('data', (data) => resultAPIs.push(data.Summary))
    .on('end', () => {
      console.log("Run all APIs: "+resultAPIs);
      APIs = resultAPIs.toString().replace(/,/g,', ');
      console.log("KQ: "+APIs);
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
              msg.text = 'Hi all,\nThis is automation report of all scripts APIs:\n'
                  +'   * '+APIs+'\n\n'
                  +'Failed '+count+' test cases:'
                  +'\n   - '+anotherString
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
                  //Delete file
                  fs.unlink('output/reports_API.csv', function (err) {
                    if (err) throw err;
                    // if no error, file has been deleted successfully
                    console.log('File deleted!');
                  });
                }
              });
            });
      }else{
        msg = mailOptions;
        msg.subject = '[Automation Report] - Run All Scripts APIs';
        msg.text = 'Hi all,\nThis is automation report of all scripts APIs:\n'+APIs+'\n  => No test cases failed!'
            +'\n\n\nThanks\n'
            +'Automation Team.',
            transporter.sendMail(mailOptions, function(error, info){
              if (error) {
                console.log("Send email not successful!");
              } else {
                console.log('Send email successful!');
                //Delete file
                fs.unlink('output/reports_API.csv', function (err) {
                  if (err) throw err;
                  // if no error, file has been deleted successfully
                  console.log('File deleted!');
                });
              }
            });
      }
    });
