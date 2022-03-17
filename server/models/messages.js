var db = require('../db');

module.exports = {
  getAll: function (callback) {
    db.connect();
    db.query('SELECT * FROM Messages', (error, results) => {
      if (error) {
        callback(error);
      } else {
        callback(null, results);
      }
    });

  },
  create: function (messageObj, callback) {
    db.connect();
    const dbMessage = {
      'Username': messageObj.username,
      'Message Text': messageObj.message,
      'Room Name': messageObj.roomname
    };

    db.query('INSERT INTO Messages SET ?', dbMessage, (error, results) => {
      if (error) {
        callback(error);
      } else {
        callback(null, results);
        // db.end();
      }
    });

  }
};
