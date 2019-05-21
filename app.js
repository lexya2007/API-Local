var express = require('express');
var fs = require('fs');
var bodyParser = require('body-parser');
const createCsvWriter = require('csv-writer').createObjectCsvWriter;
var csvFilename = './tests/output/reports_failed.csv';//path of csv file
const csvWriter = createCsvWriter({
    path: csvFilename,
    header: [
        {id: 'project', title: 'Project'},
        {id: 'assigned', title: 'Assigned To'},
        {id: 'summary', title: 'Summary'},
        {id: 'description', title: 'Description'},
        {id: 'priority', title: 'Priority Level'}
    ]
});
var version;
var app = express();
app.use( bodyParser.json() );       // to support JSON-encoded bodies
app.use(bodyParser.urlencoded({     // to support URL-encoded bodies
    extended: true
}));
app.use(bodyParser.json({limit: "50mb"}));
app.use(bodyParser.urlencoded({limit: "50mb", extended: true, parameterLimit:50000}));

app.post('/report', function(req, res) {
    var collection = req.body['collection'];
    if(req.body['endpoint'] != null){
        var getVersion = req.body['endpoint'].split("/",2).toString(); // Get version from endpoint
        var version = getVersion.replace(',',"/");
    }
    if (collection == null) {
        collection = '';
    }

    var outputFilename = './tests/output/reports_' + collection + '.txt'; // path of the file to output
    var outputFailed = './tests/output/reports_failed_' + collection + '.txt'; // path of the failed Tc

    console.log(JSON.stringify(req.body));

    fs.appendFileSync(outputFilename, 'Title TC: ' + req.body['title'] + '\n' + 'endpoint: ' + req.body['endpoint'] + '\n' + 'method: ' + req.body['method'] + '\n' + 'error: ' + req.body['error'] + '\n' + 'status: ' + req.body['status'] + '\n' + 'response message: ' + req.body['description'] + '\n' + '\n'); // write to the file system


    var data = [
        {
            project: 'Backend & Infrastructure',
            assigned: 'Tho Vo',
            summary: '['+version+']'+'['+req.body['collection']+']'+' - '+req.body['title']+' - '+req.body['error'],
            description: 'Title: ' + req.body['title'] + '\n' + 'endpoint: ' + req.body['endpoint'] + '\n' + 'method: ' + req.body['method'] + '\n' + 'error: ' + req.body['error'] + '\n' + 'status: ' + req.body['status'] + '\n' + 'response message: ' + req.body['description'] + '\n' + '\n',
            priority: 'P3 - Normal',
        }
    ];

    //Create failed TC report
    if (req.body['title'].includes("Failed")) {
        //Write file txt failed report
        fs.appendFileSync(outputFailed, 'Title TC: ' + req.body['title'] + '\n' + 'endpoint: ' + req.body['endpoint'] + '\n' + 'method: ' + req.body['method'] + '\n' + 'error: ' + req.body['error'] + '\n' + 'status: ' + req.body['status'] + '\n' + 'response message: ' + req.body['description'] + '\n' + '\n'); // write to the file system


        // Write csv file
        csvWriter.writeRecords(data)
            .then(()=> console.log('The CSV file was written successfully'));

    }

    res.send({ result: 'success' });

});


var port = 3100;
app.listen(port);
console.log('Report service started on port %d ...!!', port);
console.log("listening...\n.\n.\n");
