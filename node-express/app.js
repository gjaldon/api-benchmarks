var express = require('express');
var app = express();
var MongoClient = require('mongodb').MongoClient;
var util = require('util');

var mongoUrl = "mongodb://localhost:27017/quipper_web_development";
MongoClient.connect(mongoUrl, function (err, db) {
  if (err) {
    console.error(err);
    process.exit(1);
  }

  app.get('/ping', function (req, res) {
    db.collection('users')
      .find({ username: 'student1' })
      .limit(1)
      .toArray(function (err, users) {
        if (err || users.length === 0) return res.send(404);
      var user = users[0];
      res.json({ username: user.username });
    });
      });

  app.listen(3000, function () {
    console.log('app is listening on port 3000');
  });
});
