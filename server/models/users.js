var db = require('../db');

module.exports = {
  getAll: function (callback) {
    db.connect();
    db.query('SELECT * FROM `Users`', (error, results) => {
      if (error) {
        callback(error);
      } else {
        callback(null, results);
      }
    });
  },
  create: function (username, callback) {
    db.connect();

    const newUser = { 'Username': username };

    db.query('INSERT INTO `Users` SET ?', newUser, (error, results) => {
      if (error) {
        callback(error);
      } else {
        callback(null, results);
      }
    });
  }
};
